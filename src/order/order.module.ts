import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { OrderService } from './order.service';
import { OrderController } from './order.controller';
import { Order } from 'src/entity/order.entity';
import { OrderDetail } from 'src/entity/order_detail.entity';
import { Status } from 'src/entity/status.entity';
import { StatusModule } from 'src/status/status.module';
import { Product } from 'src/entity/product.entity';
import { ProductModule } from 'src/product/product.module';
import { Department } from 'src/entity/department.entity';
import { DepartmentModule } from 'src/department/department.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Order, OrderDetail, Status, Product, Department]),
    StatusModule,
    ProductModule,
    DepartmentModule,
  ],
  controllers: [OrderController],
  providers: [OrderService],
})
export class OrderModule {}
