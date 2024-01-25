import { HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Image } from 'src/entity/image.entity';
import { Product } from 'src/entity/product.entity';
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
  ) {
    const productRepository = getRepository(Product);
  }

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

  //   [
  //     null,
  //     151,
  //     "Ổ đôi 3 chấu có màn che, Bắt Vít - WEV1582-7SW",
  //     "Cái",
  //     {
  //         "formula": "VLOOKUP(C8,$K$9:$L$38,2,FALSE)",
  //         "result": "b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     60000,
  //     "Văn phòng phẩm",
  //     {
  //         "formula": "VLOOKUP(F8,$N$9:$O$12,2,FALSE)",
  //         "result": "688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     56,
  //     "Note ne",
  //     null,
  //     "ID đơn vị tính",
  //     "ID đơn vị tính",
  //     null,
  //     "ID danh mục",
  //     "ID danh mục"
  // ],
  // [
  //     null,
  //     152,
  //     "Ốc lục giác",
  //     "Cái",
  //     {
  //         "formula": "VLOOKUP(C9,$K$9:$L$38,2,FALSE)",
  //         "result": "b4cf7b6e-c3ae-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     4500,
  //     "Văn phòng phẩm",
  //     {
  //         "formula": "VLOOKUP(F9,$N$9:$O$12,2,FALSE)",
  //         "result": "688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     25,
  //     "Note ne",
  //     null,
  //     "Tên",
  //     "ID",
  //     null,
  //     "Tên",
  //     "ID"
  // ],
  // [
  //     null,
  //     153,
  //     "Ống 3*4",
  //     "Mét",
  //     {
  //         "formula": "VLOOKUP(C10,$K$9:$L$38,2,FALSE)",
  //         "result": "856026b4-c3ae-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     185000,
  //     "Văn phòng phẩm",
  //     {
  //         "formula": "VLOOKUP(F10,$N$9:$O$12,2,FALSE)",
  //         "result": "688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb"
  //     },
  //     55,
  //     "Note ne",
  //     null,
  //     "Bộ",
  //     "59381467-c3ae-ee11-a1ca-04d9f5c9d2eb",
  //     null,
  //     "Văn phòng phẩm",
  //     "688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb"
  // ],
  // ]
  async uploadExcel(body, file, request, res) {
    const workbook = new ExcelJS.Workbook();
    await workbook.xlsx.load(file.buffer);
    const data = [];
    workbook.eachSheet((sheet, id) => {
      sheet.eachRow((row, rowIndex) => {
        data.push(row.values);
        console.log(`rowIndex at ${rowIndex}`, row.values);
      });
    });
    return res.status(HttpStatus.OK).send(data);
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
