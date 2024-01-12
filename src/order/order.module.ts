import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { OrderService } from './order.service';
import { OrderController } from './order.controller';
import { Order } from 'src/entity/order.entity';
import { OrderDetail } from 'src/entity/order_detail.entity';
import { Status } from 'src/entity/status.entity';
import { StatusModule } from 'src/status/status.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Order, OrderDetail, Status]),
    StatusModule,
  ],
  controllers: [OrderController],
  providers: [OrderService],
})
export class OrderModule {}
