/* eslint-disable prettier/prettier */
import { Entity, Column, ManyToOne} from 'typeorm';
import { Product } from './product.entity';

@Entity()
export class Image {
  @Column({ primary: true, generated: 'uuid' })
  imageID: string;

  @Column()
  productID: string;

  @Column()
  url: string;

  @Column({ nullable: true })
  title: string;

  @Column({ default: true })
  isShow: string;

  @ManyToOne(() => Product, product => product.images)
  product: Product;
}
