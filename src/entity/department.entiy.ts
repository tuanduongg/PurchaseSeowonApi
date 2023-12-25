/* eslint-disable prettier/prettier */
import {
    Entity,
    PrimaryGeneratedColumn,
    Column
  } from 'typeorm';
  
  @Entity()
  export class Department {
    
    @PrimaryGeneratedColumn()
    departID: number;

    @Column()
    departName: string;
  }
  