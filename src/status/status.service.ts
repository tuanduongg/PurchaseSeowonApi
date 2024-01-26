import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Status } from 'src/entity/status.entity';
import { MoreThanOrEqual, Repository } from 'typeorm';

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
    return await this.repo.find({ order: { level: 'ASC' } });
  }
  async findByID(id) {
    return await this.repo.findOneOrFail({ where: { statusID: id } });
  }
  async findByUserID(userId) {
    return await this.repo.findOne({ where: { userID: userId } });
  }
  async findByLevel(level) {
    return await this.repo.findOne({ where: { level } });
  }
  async findByLevelWithMax(level) {
    const data = await this.repo.find({ order: { level: 'DESC' } });
    const result = {
      find: null,
      max: null,
    };
    if (data?.length > 0) {
      result.find = data.find((item) => item.level === level);
      result.max = data[0];
    }
    return result;
  }
  // async getDepartIDAcceptor() {
  //   const data = await this.repo.find({
  //     where: { level: MoreThanOrEqual(3) },
  //     relations: ['user'],
  //   });
  //   return result;
  // }
}
