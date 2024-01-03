/* eslint-disable prettier/prettier */
import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class Department {
  @PrimaryGeneratedColumn('uuid')
  departID: number;

  @Column()
  departName: string;

}
