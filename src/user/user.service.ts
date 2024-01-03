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
    console.log('process.env.ROUND_SALT', process.env.ROUND_SALT || 10);
    return 'Hello World!!!!!!';
  }
  async findByUsername(username) {
    const userName = await this.userRepo.findOne({
      where: { username: username },
    });
    return userName;
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
