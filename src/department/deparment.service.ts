import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Department } from 'src/entity/department.entity';
import { Repository } from 'typeorm';

@Injectable()
export class CategoryService {
  constructor(
    @InjectRepository(Department)
    private departRepo: Repository<Department>,
  ) {}

  async fake() {
    return this.departRepo.insert([
      { departName: 'Assy' },
      { departName: 'Per/Acc/IT' },
      { departName: 'QC' },
      { departName: 'Rubber' },
      { departName: 'Injection' },
    ]);
  }
  async getAll() {
    return await this.departRepo.find({});
  }
}
