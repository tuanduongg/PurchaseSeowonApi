/* eslint-disable prettier/prettier */
import { Entity, Column } from 'typeorm';

@Entity()
export class OrderDetail {
  @Column({ primary: true })
  orderID: string;

  @Column({ primary: true })
  productID: string;

  @Column()
  price: string;

  @Column()
  quantity: number;

  @Column()
  unit: string;

  //   @ManyToOne(() => Order, (order) => order.orderID)
  //   @JoinColumn({ name: 'orderID' })
  //   order?: Order;
}
