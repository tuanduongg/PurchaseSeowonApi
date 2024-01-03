/* eslint-disable prettier/prettier */
import {
  Entity,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  DeleteDateColumn,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class Order {
  @PrimaryGeneratedColumn('uuid')
  orderID: string;

  @Column()
  userID: string;

  @Column('decimal', { precision: 8, scale: 2 })
  total: number;

  @Column()
  reciever: string;

  @Column()
  address: string;

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
}
