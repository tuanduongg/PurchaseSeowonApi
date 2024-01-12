import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Status } from 'src/entity/status.entity';
import { Repository } from 'typeorm';

@Injectable()
export class StatusService {
  constructor(
    @InjectRepository(Status)
    private repo: Repository<Status>,
  ) {}

  // async fake() {
  //   return this.repo.insert([
  //     { departName: 'Assy' },
  //     { departName: 'Per/Acc/IT' },
  //     { departName: 'QC' },
  //     { departName: 'Rubber' },
  //     { departName: 'Injection' },
  //   ]);
  // }
  async getAll() {
    return await this.repo.find({});
  }
  async findByID(id) {
    return await this.repo.findOneOrFail({ where: { statusID: id } });
  }
  async findByUserID(userId) {
    return await this.repo.findOne({ where: { userID: userId } });
  }
}
