/* eslint-disable prettier/prettier */
import { Entity, Column } from 'typeorm';

@Entity()
export class OrderDetail {
  @Column({ primary: true })
  orderID: string;

  @Column({ primary: true })
  productID: string;

  @Column('decimal', { precision: 8, scale: 2 })
  price: number;

  @Column()
  quantity: number;

//   @ManyToOne(() => Order, (order) => order.orderID)
//   @JoinColumn({ name: 'orderID' })
//   order?: Order;
}
