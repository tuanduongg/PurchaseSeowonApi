/* eslint-disable prettier/prettier */
import {
  Entity,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  DeleteDateColumn,
  PrimaryGeneratedColumn,
  OneToMany,
} from 'typeorm';
import { OrderDetail } from './order_detail.entity';

@Entity()
export class Order {
  @PrimaryGeneratedColumn('uuid')
  orderID: string;

  @Column({ unique: true })
  code: string;

  @Column()
  userID: string;

  @Column({ nullable: true })
  total: string;

  @Column()
  reciever: string;

  @Column()
  address: string;
  @Column()
  note: string;

  @Column()
  status: string;

  @CreateDateColumn({ type: 'datetime' })
  created_at: Date;

  @Column({ nullable: true })
  created_by: string;

  @UpdateDateColumn({ type: 'datetime' })
  updated_at: Date;

  @Column({ nullable: true })
  updated_by: string;

  @DeleteDateColumn({ type: 'datetime', nullable: true })
  delete_at: Date;

  @Column({ nullable: true })
  deleted_by: string;

  @OneToMany(() => OrderDetail, (orderDetail) => orderDetail.order)
  orderDetail: OrderDetail[];
}
