import { Controller, Get, HttpStatus, Res } from '@nestjs/common';
import { Response } from 'express';
import { OrderService } from './order.service';

@Controller('/order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Get('/fake')
  async fakeData(@Res() res: Response) {
    const data = await this.orderService.fake();
    return res.status(HttpStatus.OK).send(data);
  }
  @Get('/all')
  async getAll(@Res() res: Response) {
    const data = await this.orderService.getAll();
    return res.status(HttpStatus.OK).send(data);
  }
}
