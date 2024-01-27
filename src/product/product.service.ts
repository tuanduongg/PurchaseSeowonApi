import { HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Image } from 'src/entity/image.entity';
import { Product } from 'src/entity/product.entity';
import { checkISObject } from 'src/helper/helper';
import { In, IsNull, Like, Repository } from 'typeorm';
const ExcelJS = require('exceljs');
import { getRepository } from 'typeorm';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private readonly productRepo: Repository<Product>,
    @InjectRepository(Image)
    private readonly imageRepo: Repository<Image>,
  ) {}

  async changePublic(body) {
    const productID = body.productID;
    const product = await this.productRepo.findOne({ where: { productID } });
    if (product) {
      product.isShow = !product.isShow;
      return await this.productRepo.save(product);
    }
    return null;
  }

  async addProduct(product, user, files) {
    const productNew = await this.productRepo.insert({
      productName: product?.name,
      price: `${product?.price}`,
      description: product?.description,
      inventory: +product?.inventory,
      categoryID: product?.category,
      unitID: product?.unitID,
      isShow: true,
      created_by: user?.username,
    });
    if (productNew) {
      const productID = productNew?.raw[0]?.productID;
      let images = {};
      if (files && files?.length > 0) {
        const arrFiles = [];
        files.map((item, index) => {
          arrFiles.push({
            productID: productID,
            url: `${item?.filename}`,
            title: `${item?.originalname}`,
          });
        });
        images = await this.imageRepo.insert(arrFiles);
      }
      return { productNew, images };
      // return await this.productRepo.insert([productNew]);
    }
    return null;
  }

  async editProduct(product, user, files) {
    const productID = product?.productID;
    if (productID) {
      const updates = {
        productName: product?.name,
        price: `${product?.price}`,
        description: product?.description,
        inventory: product?.inventory,
        categoryID: product?.category,
        unitID: product?.unitID,
        isShow: true,
        updated_by: user?.username,
      };
      const updateResult = await this.productRepo.update(productID, updates);
      if (updateResult.affected === 1) {
        let images = {};
        if (files && files?.length > 0) {
          const arrFiles = [];
          files.map((item, index) => {
            arrFiles.push({
              productID: productID,
              url: `${item?.filename}`,
              title: `${item?.originalname}`,
            });
          });
          images = await this.imageRepo.insert(arrFiles);
        }
        return { updateResult, images };
      }
    }
    return null;
  }

  async deleteProduct(body, request) {
    // console.log('request', request);
    const productID = body.productID;
    const product = await this.productRepo.findOne({ where: { productID } });
    if (product) {
      product.deleted_by = request?.user?.username;
      product.delete_at = new Date();
      return await this.productRepo.save(product);
    }
    return null;
  }

  async getAllIsShow(query, isShowProp?) {
    const take = +query.rowsPerPage || 10;
    const page = query.page || 0;
    const skip = page * take;
    const search = query.search || '';
    const categoryID = query.categoryID || '';
    const isShow = isShowProp ? isShowProp : false;

    const objWhere = isShowProp
      ? {
          isShow,
          productName: Like('%' + search + '%'),
          categoryID: categoryID,
        }
      : { productName: Like('%' + search + '%') };

    if (categoryID) {
      objWhere.categoryID = categoryID;
    } else {
      delete objWhere.categoryID;
    }
    const [result, total] = await this.productRepo.findAndCount({
      where: objWhere,
      relations: ['images', 'category', 'unit'],
      order: { created_at: 'DESC' },
      take: take,
      skip: skip,
    });

    return {
      data: result,
      count: total,
    };
  }
  async changeInventory(products) {
    if (products) {
      const data = await this.productRepo.save(products);
      return data;
    }
    return null;
  }

  async uploadExcel(body, file, request, res) {
    const arrLength = [13, 10, 16];
    const workbook = new ExcelJS.Workbook();
    await workbook.xlsx.load(file.buffer);
    let textErr = '';
    const arrProduct = [];
    workbook.eachSheet((sheet, id) => {
      sheet.eachRow((row, rowIndex) => {
        const valueCol1 = row?.getCell(1)?.value;
        if (arrLength.includes(row?.values?.length) && valueCol1) {
          if (typeof valueCol1 !== 'string') {
            const value2 = row.getCell(2).value; //name
            const value5 = row.getCell(5).value; //price
            const value9 = row.getCell(9).value; //note
            const value4 = row.getCell(4).value; //unit
            const value7 = row.getCell(7).value; //danh muc
            const value8 = row.getCell(8).value; //ton kho

            let unitID = '',
              categoryID = '',
              inventory = 0;

            if (value8 && typeof value8 === 'number') {
              inventory = value8;
            } else {
              textErr = `Error at ${rowIndex + 1}: invalid value colum 8`;
              return;
            }
            switch (typeof value4) {
              case 'string':
                unitID = value4;
                break;
              case 'object':
                unitID = value4?.result;
                break;

              default:
                textErr = `Error at ${rowIndex + 1}: invalid value colum 4`;
                return;
            }
            switch (typeof value7) {
              case 'string':
                categoryID = value7;
                break;
              case 'object':
                categoryID = value7?.result;
                break;

              default:
                textErr = `Error at ${rowIndex + 1}: invalid value colum 7`;
                return;
            }
            arrProduct.push({
              productName: value2,
              price: `${value5}`,
              inventory: inventory,
              description: `${value9}`,
              categoryID: categoryID,
              unitID: unitID,
              created_by: request?.user?.username,
              isShow: true,
            });
          }
        }
      });
      if (textErr !== '') {
        return;
      }
    });
    if (textErr !== '') {
      return res.status(HttpStatus.BAD_REQUEST).send({ message: textErr });
    }
    try {
      const dataUpdate = await this.productRepo.insert(arrProduct);
      return res.status(HttpStatus.OK).send(dataUpdate);
    } catch (error) {
      return res
        .status(HttpStatus.BAD_REQUEST)
        .send({ message: 'Insert fail!' });
    }
  }

  // const productRepository = getRepository(Product);
  // {
  //   'adfadsf':1,
  //   'adfadsf2':1,
  //   'adfadsf3':1,
  // }
  async updateInventory(productIDs) {
    // [
    //   { productID: '1', quantity: 2 },
    //   { productID: '2', quantity: 6 },
    //   { productID: '3', quantity: 8 },
    // ];
    const data = await Promise.all(
      productIDs.map(async ({ productID, quantity }) => {
        await this.productRepo
          .createQueryBuilder()
          .update(Product)
          .set({ inventory: () => `"inventory" - ${quantity}` })
          .where('productID = :productID', { productID })
          .execute();
      }),
    );
    return data;
  }
}
