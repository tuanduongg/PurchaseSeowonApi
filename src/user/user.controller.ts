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
import { UserService } from './user.service';
import { Request, Response } from 'express';
import { AuthGuard } from 'src/auth/auth.guard';

@Controller('/user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get()
  getHello(): string {
    return this.userService.getHello();
  }
  @Get('/fake')
  fake() {
    return this.userService.fake();
  }

  @UseGuards(AuthGuard)
  @Post('/all')
  async getAll(@Body() body, @Req() request: Request, @Res() res: Response) {
    const data = await this.userService.all(body, request);
    if (data) {
      return res.status(HttpStatus.OK).send(data);
    }
    return res
      .status(HttpStatus.BAD_REQUEST)
      .send({ message: 'Get data fail!' });
  }

  @UseGuards(AuthGuard)
  @Post('/add')
  async add(@Body() body, @Req() request: Request, @Res() res: Response) {
    const data = await this.userService.add(body, request);
    if (data) {
      console.log('data', data);
      if (data == 'Username already exists') {
        return res.status(HttpStatus.BAD_REQUEST).send({ message: data });
      }
      return res.status(HttpStatus.OK).send(data);
    }
    return res.status(HttpStatus.BAD_REQUEST).send({ message: 'Insert fail!' });
  }

  @UseGuards(AuthGuard)
  @Post('/edit')
  async edit(@Body() body, @Req() request: Request, @Res() res: Response) {
    if (body?.userID) {
      const data = await this.userService.edit(body, request);
      if (data) {
        return res.status(HttpStatus.OK).send(data);
      }
    }
    return res.status(HttpStatus.BAD_REQUEST).send({ message: 'Update fail!' });
  }

  @UseGuards(AuthGuard)
  @Get('/info')
  getUser(@Req() request: Request) {
    return this.userService.getUser(request);
  }
}
