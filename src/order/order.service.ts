import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from 'src/entity/order.entity';
import { OrderDetail } from 'src/entity/order_detail.entity';
import { getSubTotal, ranDomUID } from 'src/helper/helper';
import { StatusService } from 'src/status/status.service';
import { Between, Equal, LessThanOrEqual, Like, Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private orderRepo: Repository<Order>,
    @InjectRepository(OrderDetail)
    private orderDetailRepo: Repository<OrderDetail>,
    private readonly statusService: StatusService,
  ) {}

  async fake() {
    return this.orderRepo.insert([
      {
        total: `12000`,
        address: 'B2',
        reciever: 'Kho b2',
        // status: OrderEnum.NEW,
        userID: '',
      },
      // {
      //   productID: 'db025e2f-09aa-ee11-a1ca-04d9f5c9d2eb',
      //   url: '/image2.jpg',
      // },
    ]);
  }
  async getAll(query, userReq) {
    // const userReq = {
    //   username: 'admin',
    //   id: '58AC5FB3-08AA-EE11-A1CA-04D9F5C9D2EB',
    //   departmentID: '1370A16B-08AA-EE11-A1CA-04D9F5C9D2EB',
    //   isManager: true,
    //   email: null,
    // };

    const take = +query.rowsPerPage || 10;
    const page = +query.page || 0;
    const skip = page * take;
    const search = query.search || '';
    const fromDate = query.fromDate ? new Date(query.fromDate) : new Date();
    const toDate = query.toDate ? new Date(query.toDate) : new Date();
    const status = query.status;
    // const objWhere = {
    //   code: Like('%' + search + '%'),
    //   created_at: Between(fromDate, toDate),
    //   status: status,
    // };
    const arrWhere = [];
    const objCondition = {
      code: Like('%' + search + '%'),
      created_at: Between(fromDate, toDate),
      status: { value: status, level: LessThanOrEqual(1) },
      departmentID: userReq?.departmentID,
      userID: userReq.id,
    };
    if (!status) {
      delete objCondition.status.value;
    }
    const userStatus = await this.statusService.findByUserID(userReq.id);
    if (userStatus) {
      objCondition.status.level = Equal(userStatus?.level - 1);
      objCondition.userID = userReq?.id;
      // co trong danh sach duyet -> lấy những đơn status level người hiện tại - 1
    } else {
      if (userReq?.isManager) {
        // lấy order của chính mk + order của bộ phận
        // arrWhere.userID = userReq.id;
        const objectTepm = { ...objCondition };
        delete objCondition.departmentID;
        delete objectTepm.userID;
        arrWhere.push(objectTepm);
      } else {
        delete objCondition.departmentID;
        delete objCondition.status.level;
        objCondition.userID = userReq?.id;
      }
    }
    arrWhere.push(objCondition);

    // nếu là staff -> lấy order của người đó
    // nếu manager -> order của người đó + order bộ phận
    // người duyệt 1 -> lấy order level trừ 1
    // ....
    // mrstỉnh lấy

    const [result, total] = await this.orderRepo.findAndCount({
      select: {
        orderID: true,
        code: true,
        userID: true,
        departmentID: true,
        total: true,
        reciever: true,
        address: true,
        note: true,
        created_at: true,
        created_by: true,
        status: {
          statusID: true,
          statusName: true,
          userID: true,
          level: true,
        },
        orderDetail: {
          orderDetailID: true,
          price: true,
          quantity: true,
          unit: true,
          product: {
            productID: true,
            productName: true,
            description: true,
            images: true,
          },
        },
      },
      where: arrWhere,
      relations: [
        'status',
        'orderDetail',
        'orderDetail.product',
        'orderDetail.product.images',
      ],
      order: { created_at: 'DESC' },
      take: take,
      skip: skip,
    });

    return {
      data: result,
      count: total,
      userStatus,
    };
  }

  async addNew(body, request) {
    if (body?.products) {
      const productArr = JSON.parse(body?.products);
      const total = getSubTotal(productArr);
      const data = {
        userID: request?.user?.id,
        departmentID: request?.user?.departmentID,
        total: `${total}`,
        reciever: body?.reciever,
        note: body?.note,
        address: body?.address,
        statusID: '0e112e77-f3b0-ee11-a1ca-04d9f5c9d2eb',
        created_by: request?.user?.username,
        code: ranDomUID(),
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
  async changeStatus(body, request) {
    const orderID = body?.orderID;
    const status = body?.status;
    if (orderID) {
      if (status) {
        const statusNew = await this.statusService.findByLevel(
          status?.level + 1,
        );
        if (statusNew) {
          const order = await this.orderRepo.update(orderID, {
            statusID: statusNew.statusID,
            updated_by: request?.user?.username,
          });
          return order;
        }
      } else {
        const order = await this.orderRepo.update(orderID, {
          statusID: '7d39e061-fbb0-ee11-a1ca-04d9f5c9d2eb',
          updated_by: request?.user?.username,
          cancel_by: request?.user?.username,
        });
        return order;
      }
    }
    return null;
  }
}
