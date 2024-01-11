import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/entity/user.entity';
import { Repository } from 'typeorm';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepo: Repository<User>,
  ) {}
  getHello(): string {
    return 'Hello World!!!!!!';
  }
  async findByUsername(username) {
    const userName = await this.userRepo.findOne({
      where: { username: username },
    });
    return userName;
  }
  async getUser(request) {
    const userID = request?.user?.id;
    const user = await this.userRepo.findOneOrFail({
      where: { userID },
      relations: ['department'],
    });
    return user;
  }
  async fake() {
    const user = await this.userRepo.insert({
      username: 'admin',
      password: '1234',
      departmentID: '1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb',
    });
    return user;
  }
}
