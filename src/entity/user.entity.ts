/* eslint-disable prettier/prettier */
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  DeleteDateColumn,
  BeforeInsert,
  ManyToOne,
  JoinColumn,
} from 'typeorm';

import * as bcrypt from 'bcrypt';
import { Department } from './department.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  userID: string;

  @Column({ unique: true })
  username: string;

  @Column()
  password: string;

  @Column({ default: null })
  departmentID: string;

  @Column({ default: false })
  isManager: boolean;

  @Column({ nullable: true })
  email: string;

  @CreateDateColumn({ type: 'datetime' })
  created_at: Date;

  @UpdateDateColumn({ type: 'datetime' })
  updated_at: Date;

  @DeleteDateColumn({ type: 'datetime', nullable: true })
  delete_at: Date;

  @Column({ nullable: true })
  updated_by: string;

  @Column({ nullable: true })
  deleted_by: string;

  @Column({ nullable: true })
  isApprover: boolean;

  @BeforeInsert()
  async hashPassword() {
    this.password = await bcrypt.hash(
      this.password,
      process.env.ROUND_SALT || 10,
    );
  }
  @ManyToOne(() => Department, (department) => department.users)
  @JoinColumn({ name: 'departmentID', referencedColumnName: 'departID' })
  department: Department;
}
