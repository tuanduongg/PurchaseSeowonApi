import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from 'src/entity/product.entity';
import { Like, Repository } from 'typeorm';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private readonly productRepo: Repository<Product>,
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
  async getAllIsShow(query, isShowProp?) {
    console.log('query', query);
    const take = +query.rowsPerPage || 12;
    let skip = query.page * take;
    console.log('skip * take', skip * take);
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
      relations: ['images', 'category'],
      order: { created_at: 'DESC' },
      take: take,
      skip: skip,
    });

    return {
      data: result,
      count: total,
    };
  }
  async fakeData() {
    const data = [
      {
        productName: 'Giấy A4',

        price: 120000,

        inventory: 200,

        description:
          'Kim Bấm số 10 Plus Đặc điểm: Kim bấm số 10 kích thước nhỏ sử dụng cho bấm kim số 10, có các nhãn hiệu để các bạn chọn lựa phù hợp cho dụng cụ bấm kim, phục vụ thuận tiện trong quá trình kẹp bấm giấy tờ tài liệu số lượng ít, định lượng giấy mỏng nhanh chóng và dễ dàng. Đóng gói: 20 hộp/ hộp lớn. Xuất xứ: Việt Nam Bảo quản: Tránh xa nguồn nhiệt và dầu mỡ. Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng',

        categoryID: 'f7022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: true,
      },
      {
        productName: 'Ghim bấm giấy',

        price: 1200,

        inventory: 124,

        description: 'Ghim bấm đầu trònnnnn',

        categoryID: 'f7022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: true,
      },
      {
        productName: 'Kẹp giấy đầu tròn c32',

        price: 3200,

        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
      {
        productName: 'Kim bấm số 10 Plus',
        // image: 'https://cdn.fast.vn/tmp/20210217090347-6.JPG',
        price: 5000,
        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
      {
        productName: 'Kẹp giấy đầu tròn C82 LOẠI LỚN',
        // image: 'https://cdn.fast.vn/tmp/20210610144411-c82-2.jpg',
        price: 5600,
        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
      {
        productName: 'Giấy in A4 Double A',
        // image:
        //   'https://vanphong-pham.com/wp-content/uploads/2021/10/giay-a4-double.jpg',
        price: 120000,
        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
      {
        productName: 'Găng tay len kim 10 ngà 60g',
        // image:
        //   'https://img.super-mro.com/super-mro/2023/09/w550/gang-tay-len-kim-10-nga-60g.jpg.webp',
        price: 5600,
        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
      {
        productName: 'Băng dính trong',
        // image:
        //   'https://bizweb.dktcdn.net/thumb/1024x1024/100/387/548/products/bang-dinh-trong-5cm.png?v=1589959476467',
        price: 20000,
        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: 'f5022917-43ac-ee11-a1cd-08bfb89bcbb5',

        isShow: false,
      },
    ];
    const products = await this.productRepo.insert(data);
    return products;
  }
}
