import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from 'src/entity/order.entity';
import { OrderDetail } from 'src/entity/order_detail.entity';
import { OrderEnum } from 'src/enum/order.enum';
import { getSubTotal } from 'src/helper/helper';
import { Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private orderRepo: Repository<Order>,
    @InjectRepository(OrderDetail)
    private orderDetailRepo: Repository<OrderDetail>,
  ) {}

  async fake() {
    return this.orderRepo.insert([
      {
        total: `12000`,
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
  async addNew(body, request) {
    if (body?.products) {
      const productArr = JSON.parse(body?.products);
      const total = getSubTotal(productArr);
      const data = {
        userID: request?.user?.id,
        total: `${total}`,
        reciever: body?.reciever,
        note: body?.note,
        address: body?.address,
        status: OrderEnum.NEW,
        created_by: request?.user?.username,
      };
      const newOrder = await this.orderRepo.insert(data);
      const newOrderID = newOrder?.identifiers[0]?.orderID;
      if (newOrderID) {
        const arrDetailUpdate = [];
        productArr.map((item) => {
          arrDetailUpdate.push({
            orderID: newOrderID,
            productID: item?.productID,
            price: `${item?.price}`,
            quantity: item?.quantity,
            unit: item?.unit?.unitName,
          });
        });
        try {
          const dataInserted =
            await this.orderDetailRepo.insert(arrDetailUpdate);
          return { dataInserted, newOrder };
        } catch (error) {
          console.log('error', error);
        }
      }
    }
    return null;
  }
}
