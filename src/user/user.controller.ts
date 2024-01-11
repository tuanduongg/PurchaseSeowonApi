import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { Request } from 'express';
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
  @Get('/info')
  getUser(@Req() request: Request) {
    return this.userService.getUser(request);
  }
}
