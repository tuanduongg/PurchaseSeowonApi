import { Controller, Get, HttpStatus, Res } from '@nestjs/common';
import { Response } from 'express';
import { CategoryService } from './category.service';

@Controller('/category')
export class CategoryController {
  constructor(private readonly cateService: CategoryService) {}

  @Get('/fake')
  async fakeData(@Res() res: Response) {
    const data = await this.cateService.fake();
    return res.status(HttpStatus.OK).send(data);
  }
  @Get('/all')
  async getAll(@Res() res: Response) {
    const data = await this.cateService.getAll();
    return res.status(HttpStatus.OK).send(data);
  }
}
