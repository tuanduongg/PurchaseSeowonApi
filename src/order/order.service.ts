import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DepartmentService } from 'src/department/deparment.service';
import { Order } from 'src/entity/order.entity';
import { OrderDetail } from 'src/entity/order_detail.entity';
import { getSubTotal, ranDomUID } from 'src/helper/helper';
import { ProductService } from 'src/product/product.service';
import { StatusService } from 'src/status/status.service';
import {
  Between,
  Equal,
  In,
  LessThanOrEqual,
  Like,
  MoreThanOrEqual,
  Not,
  Repository,
} from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private orderRepo: Repository<Order>,
    @InjectRepository(OrderDetail)
    private orderDetailRepo: Repository<OrderDetail>,
    private readonly statusService: StatusService,
    private readonly productService: ProductService,
    private readonly departService: DepartmentService,
  ) {}
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

    const cancelByWhere = {
      code: Like('%' + search + '%'),
      created_at: Between(fromDate, toDate),
      cancel_by: userReq?.username,
      // status: { value: status },
    };

    const userStatus = await this.statusService.findByUserID(userReq.id);

    const objMyOrder = {
      code: Like('%' + search + '%'),
      created_at: Between(fromDate, toDate),
      userID: userReq.id,
      // status: { value: status },
    };
    arrWhere.push(objMyOrder);
    if (userReq?.isManager) {
      const objIsManagerOrder = {
        code: Like('%' + search + '%'),
        created_at: Between(fromDate, toDate),
        departmentID: userReq?.departmentID,
        // status: { value: status },
      };
      arrWhere.push(objIsManagerOrder);
      arrWhere.push(cancelByWhere);
    }
    if (userStatus) {
      const objApproved = {
        code: Like('%' + search + '%'),
        created_at: Between(fromDate, toDate),
        status: { level: MoreThanOrEqual(userStatus.level - 1) },
        departmentID: Not(In([])),
      };
      if (userStatus?.level === 3) {
        const dataDeparts = await this.departService.findByCode([
          'rd',
          'pp',
          'sale',
          'it',
          'hr',
        ]);
        let dataIdDeparts = [];
        if (dataDeparts?.length > 0) {
          dataIdDeparts = dataDeparts.map((item) => item?.departID);
          objApproved.departmentID = Not(In(dataIdDeparts));
        }
      }
      arrWhere.push(objApproved);
      arrWhere.push(cancelByWhere);
    }

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
        cancel_at: true,
        cancel_by: true,
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
      // const userStatus = await this.statusService.findByUserID(
      //   request?.user.id,
      // );
      // let statusID = '';
      // if (userStatus && request?.user?.isManager) {
      //   //neu la nguoi duyet , và người duyệt là quản lý bộ phận
      //   statusID = userStatus.statusID; //gan status la ng do
      // } else {
      //   const rs = await this.statusService.findByLevel(
      //     request?.user?.isManager ? 2 : 1,
      //   );
      //   statusID = rs.statusID;
      // }
      const userStatus = await this.statusService.findByUserID(
        request?.user.id,
      ); //check user có phải người duyệt
      let statusID = '';
      if (userStatus && request?.user?.isManager) {
        //neu la nguoi duyet , và người duyệt là quản lý bộ phận
        statusID = userStatus.statusID; //gan status la ng do
      } else {
        let statusUpdate = request?.user?.isManager ? 2 : 1;
        const dataDeparts = await this.departService.findByCode([
          'rd',
          'pp',
          'sale',
          'it',
          'hr',
        ]);
        // let levelUpdate = request?.user?.isManager ? 2 : 1;
        let dataIdDeparts = [];
        if (dataDeparts?.length > 0) {
          dataIdDeparts = dataDeparts.map((item) => item?.departID);
        }
        if (
          dataIdDeparts.includes(request?.user?.departmentID) &&
          request?.user?.isManager
        ) {
          // neu nguoi phong it, rd,sale... -> seeps song
          // levelUpdate = levelUpdate + 1;
          statusUpdate = statusUpdate + 1;
        }
        const rs = await this.statusService.findByLevel(statusUpdate); // lấy ra ID tiếp thôi
        statusID = rs.statusID;
      }

      const productArr = JSON.parse(body?.products);
      const total = getSubTotal(productArr);
      const data = {
        userID: request?.user?.id,
        departmentID: request?.user?.departmentID,
        total: `${total}`,
        reciever: body?.reciever,
        note: body?.note,
        address: body?.address,
        statusID: statusID,
        created_by: request?.user?.username,
        code: ranDomUID(),
      };
      const newOrder = await this.orderRepo.insert(data);
      const newOrderID = newOrder?.identifiers[0]?.orderID;
      if (newOrderID) {
        const arrDetailUpdate = [];
        const arrProductNew = [];
        productArr.map((item) => {
          arrProductNew.push({
            productID: item?.productID,
            inventory: parseInt(item?.inventory) - parseInt(item?.quantity),
          });
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
          // const dataProductChange =
          //   await this.productService.changeInventory(arrProductNew);
          return { dataInserted, newOrder };
        } catch (error) {
          console.log('error', error);
        }
      }
    }
    return null;
  }
  // 1270a16b-08aa-ee11-a1ca-04d9f5c9d2eb	Assy	assy
  // 1370a16b-08aa-ee11-a1ca-04d9f5c9d2eb	인사/회계/전산(Per/Acc/IT)	it
  // 1470a16b-08aa-ee11-a1ca-04d9f5c9d2eb	QC	qc
  // 1570a16b-08aa-ee11-a1ca-04d9f5c9d2eb	Rubber	rb
  // 1670a16b-08aa-ee11-a1ca-04d9f5c9d2eb	Injection	inj
  // a6e750de-f5b0-ee11-a1ca-04d9f5c9d2eb	Mold	mold
  // 8b15aae4-e0b8-ee11-a1ca-04d9f5c9d2eb	Spray	spray
  // bbb10430-f8b8-ee11-a1ca-04d9f5c9d2eb	HR	hr
  // b129f30c-ffbb-ee11-a1cb-b5b416639ec5	R&D	rd
  // b229f30c-ffbb-ee11-a1cb-b5b416639ec5	PP	pp
  // 890a051a-ffbb-ee11-a1cb-b5b416639ec5	Sale	sale
  // truong hop: khong co acc quan ly
  async changeStatus(body, request) {
    const orderID = body?.orderID;
    const status = body?.status;
    const departmentID = body?.departmentID;
    if (orderID) {
      //mr tinh len don -> mrSong -> mr
      if (status) {
        const userStatus = await this.statusService.findByUserID(
          request?.user.id,
        );
        let statusCont = status?.level + 1;
        if (
          userStatus &&
          request?.user?.isManager &&
          departmentID === request?.user?.departmentID
        ) {
          // truong hop la quan ly + nguoi duyet
          statusCont = userStatus?.level;
        }
        const dataDeparts = await this.departService.findByCode([
          'rd',
          'pp',
          'sale',
          'it',
          'hr',
        ]);
        let dataIdDeparts = [];
        if (dataDeparts?.length > 0) {
          dataIdDeparts = dataDeparts.map((item) => item?.departID);
        }
        if (dataIdDeparts.includes(departmentID) && statusCont === 2) {
          statusCont = statusCont + 1;
        }
        //nếu chuyền lên status,
        const statusNew =
          await this.statusService.findByLevelWithMax(statusCont);
        if (statusNew?.max?.level === statusCont) {
          const orderDetails = await this.orderDetailRepo.find({
            where: { orderID: orderID },
          });
          if (orderDetails?.length > 0) {
            const dataUpdate = orderDetails.map((item) => {
              return {
                productID: item.productID,
                quantity: item.quantity,
              };
            });
            const updateProducts =
              await this.productService.updateInventory(dataUpdate);
          }
        }
        if (statusNew?.find) {
          const order = await this.orderRepo.update(orderID, {
            statusID: statusNew?.find.statusID,
            updated_by: request?.user?.username,
          });
          return order;
        }
      } else {
        //truwongf hopw cancel
        const statusCancel = await this.statusService.findByLevel(0);
        const order = await this.orderRepo.update(orderID, {
          statusID: statusCancel.statusID,
          updated_by: request?.user?.username,
          cancel_by: request?.user?.username,
          cancel_at: new Date(),
        });
        return order;
      }
    }
    return null;
  }
}
