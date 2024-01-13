import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Post,
  Req,
  Res,
  UseGuards,
} from '@nestjs/common';
import { Request, Response } from 'express';
import { OrderService } from './order.service';
import { AuthGuard } from 'src/auth/auth.guard';

@Controller('/order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Get('/fake')
  async fakeData(@Res() res: Response) {
    const data = await this.orderService.fake();
    return res.status(HttpStatus.OK).send(data);
  }

  @UseGuards(AuthGuard)
  @Post('/all')
  async getAll(@Res() res: Response, @Req() request: Request, @Body() body) {
    const data = await this.orderService.getAll(body, request?.user);
    return res.status(HttpStatus.OK).send(data);
  }

  @UseGuards(AuthGuard)
  @Post('/add')
  async addNewOrder(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
  ) {
    const data = await this.orderService.addNew(body, request);
    if (data) {
      return res.status(HttpStatus.OK).send(data);
    }
    return res.status(HttpStatus.BAD_REQUEST).send({ message: 'Insert fail!' });
  }
  @UseGuards(AuthGuard)
  @Post('/change-status')
  async changeSatus(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
  ) {
    const data = await this.orderService.changeStatus(body, request);
    if (data) {
      return res.status(HttpStatus.OK).send(data);
    }
    return res
      .status(HttpStatus.BAD_REQUEST)
      .send({ message: 'Change status fail!' });
  }
}
