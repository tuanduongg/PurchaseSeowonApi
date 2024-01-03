/* eslint-disable prettier/prettier */
import {
    Entity,
    PrimaryGeneratedColumn,
    Column
  } from 'typeorm';
  
  @Entity()
  export class Category {
    
    @PrimaryGeneratedColumn('uuid')
    categoryID: string;

    @Column()
    categoryName: string;
  }
  