import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from 'src/entity/order.entity';
import { OrderEnum } from 'src/enum/order.enum';
import { Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private orderRepo: Repository<Order>,
  ) {}

  async fake() {
    return this.orderRepo.insert([
      {
        total: 12000,
        address: 'B2',
        reciever: 'Kho b2',
        status: OrderEnum.NEW,
        userID: '',
      },
      // {
      //   productID: 'db025e2f-09aa-ee11-a1ca-04d9f5c9d2eb',
      //   url: '/image2.jpg',
      // },
    ]);
  }
  async getAll() {
    return await this.orderRepo.find({});
  }
}
