import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Post,
  Req,
  Res,
  UploadedFiles,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { ProductService } from './product.service';
import { Response, Request } from 'express';
import { AuthGuard } from 'src/auth/auth.guard';
import { FilesInterceptor } from '@nestjs/platform-express';
import { multerConfig } from 'src/config/multer.config';

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

  // @UseGuards(AuthGuard)
  // @Post('/delete')
  // async delete(@Body() body, @Req() request: Request, @Res() res: Response) {
  //   const data = await this.productService.(body, request);
  //   return res.status(HttpStatus.OK).send(data);
  // }

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

  @UseGuards(AuthGuard)
  @Post('/add')
  @UseInterceptors(FilesInterceptor('files', 10, multerConfig))
  async addProduct(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
    @UploadedFiles() files: Array<Express.Multer.File>,
  ) {
    if (body?.data) {
      const product = JSON.parse(body?.data);
      const data = await this.productService.addProduct(
        product,
        request?.user,
        files,
      );
      if (data) {
        return res.status(HttpStatus.OK).send(data);
      }
    }
    return res
      .status(HttpStatus.BAD_REQUEST)
      .send({ message: 'Cannot add product!' });
  }

  @UseGuards(AuthGuard)
  @Post('/edit')
  @UseInterceptors(FilesInterceptor('files', 10, multerConfig))
  async editProduct(
    @Body() body,
    @Req() request: Request,
    @Res() res: Response,
    @UploadedFiles() files: Array<Express.Multer.File>,
  ) {
    if (body?.data) {
      const product = JSON.parse(body?.data);
      const data = await this.productService.editProduct(
        product,
        request?.user,
        files,
      );
      if (data) {
        return res.status(HttpStatus.OK).send(data);
      }
    }
    return res
      .status(HttpStatus.BAD_REQUEST)
      .send({ message: 'Cannot edit product!' });
  }

  // @Get('/fake')
  // async fakeData(@Res() res: Response) {
  //   const data = await this.productService.fakeData();
  //   return res.status(HttpStatus.OK).send(data);
  // }
}
