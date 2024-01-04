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
    const take = query.rowPerPage || 10;
    const skip = query.page || 0;
    const search = query.search || '';
    const categoryID = query.categoryID || '';
    const isShow = isShowProp ? isShowProp : false;

    const objWhere = isShowProp
      ? { productName: Like('%' + search + '%'), isShow, category: {} }
      : { productName: Like('%' + search + '%') };

    if (categoryID) {
      objWhere.category = { categoryID };
    } else {
      delete objWhere.category;
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

        categoryID: '688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb',

        isShow: true,
      },
      {
        productName: 'Ghim bấm giấy',

        price: 1200,

        inventory: 124,

        description: 'Ghim bấm đầu trònnnnn',

        categoryID: '6a8e8c27-09aa-ee11-a1ca-04d9f5c9d2eb',

        isShow: true,
      },
      {
        productName: 'Kẹp giấy đầu tròn c32',

        price: 3200,

        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: '688e8c27-09aa-ee11-a1ca-04d9f5c9d2eb',

        isShow: false,
      },
    ];
    const products = await this.productRepo.insert(data);
    return products;
  }
}
