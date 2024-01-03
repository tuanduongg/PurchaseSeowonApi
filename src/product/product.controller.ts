import { Body, Controller, Get, HttpStatus, Req, Res } from '@nestjs/common';
import { ProductService } from './product.service';
import { Response, Request } from 'express';

@Controller('/product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Get('/all')
  async getAllIsShow(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
  ) {
    const data = await this.productService.getAllIsShow(body);
    return res.status(HttpStatus.OK).send(data);
  }
  @Get('/fake')
  async fakeData(@Res() res: Response) {
    const data = await this.productService.fakeData();
    return res.status(HttpStatus.OK).send(data);
  }
}
