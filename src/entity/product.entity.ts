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
import { Image } from './image.entity';

@Entity()
export class Product {
  @PrimaryGeneratedColumn('uuid')
  productID: string;

  @Column()
  productName: string;

  @Column('decimal', { precision: 8, scale: 2 })
  price: number;

  @Column({ default: 0 })
  inventory: number;

  @Column({ type: 'nvarchar', length: 'MAX', nullable: true })
  description: string;

  @Column()
  categoryID: string;

  @Column()
  isShow: boolean;

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
  @OneToMany(() => Image, image => image.product)
  images: Image[];
}
