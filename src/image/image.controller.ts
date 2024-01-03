import { Controller, Get, HttpStatus, Res } from '@nestjs/common';
import { Response } from 'express';
import { ImageService } from './image.service';

@Controller('/image')
export class ImageController {
  constructor(private readonly cateService: ImageService) {}

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
