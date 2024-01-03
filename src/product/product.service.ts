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
  async getAllIsShow(query) {
    const take = query.take || 10;
    const skip = query.skip || 0;
    const search = query.search || '';

    const [result, total] = await this.productRepo.findAndCount({
      where: { productName: Like('%' + search + '%') },
      relations: ['images'],
      order: { created_at: 'ASC' },
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

        categoryID: '89910D3C-EAA9-EE11-A1CA-04D9F5C9D2EB',

        isShow: true,
      },
      {
        productName: 'Ghim bấm giấy',

        price: 1200,

        inventory: 124,

        description: 'Ghim bấm đầu trònnnnn',

        categoryID: '89910D3C-EAA9-EE11-A1CA-04D9F5C9D2EB',

        isShow: true,
      },
      {
        productName: 'Kẹp giấy đầu tròn c32',

        price: 3200,

        inventory: 58,

        description:
          'Công ty TNHH TM DV Văn Phòng Tổng Hợp Nam Phương chuyên cung cấp kim bấm các loại, giá cả hợp lý, hàng đảm bảo chất lượng.',

        categoryID: '89910D3C-EAA9-EE11-A1CA-04D9F5C9D2EB',

        isShow: false,
      },
    ];
    const products = await this.productRepo.insert(data);
    return products;
  }
}
