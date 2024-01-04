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
import { ProductService } from './product.service';
import { Response, Request } from 'express';
import { AuthGuard } from 'src/auth/auth.guard';

@Controller('/product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @UseGuards(AuthGuard)
  @Post('/public')
  async getAllIsShow(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
  ) {
    body.isShow = true;
    const data = await this.productService.getAllIsShow(body, true);
    return res.status(HttpStatus.OK).send(data);
  }

  @UseGuards(AuthGuard)
  @Post('/all')
  async getAll(@Body() body, @Req() request: Request, @Res() res: Response) {
    const data = await this.productService.getAllIsShow(body);
    return res.status(HttpStatus.OK).send(data);
  }

  @UseGuards(AuthGuard)
  @Post('/delete')
  async delete(@Body() body, @Req() request: Request, @Res() res: Response) {
    const data = await this.productService.getAllIsShow(body);
    return res.status(HttpStatus.OK).send(data);
  }

  @UseGuards(AuthGuard)
  @Post('/changePublic')
  async changePublic(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
  ) {
    const data = await this.productService.changePublic(body);
    if (data) {
      return res.status(HttpStatus.OK).send(data);
    }
    return res
      .status(HttpStatus.BAD_REQUEST)
      .send({ message: 'Cannot found product!' });
  }

  @Get('/fake')
  async fakeData(@Res() res: Response) {
    const data = await this.productService.fakeData();
    return res.status(HttpStatus.OK).send(data);
  }
}
