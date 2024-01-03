import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/entity/category.entity';
import { Repository } from 'typeorm';

@Injectable()
export class CategoryService {
  constructor(
    @InjectRepository(Category)
    private categoryRepo: Repository<Category>,
  ) {}

  async fake() {
    return this.categoryRepo.insert([
      { categoryName: 'Văn phòng phẩm' },
      { categoryName: 'Hàng quần áo' },
      { categoryName: 'Nước uống' },
    ]);
  }
  async getAll() {
    return await this.categoryRepo.find({});
  }
}
