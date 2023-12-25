import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    console.log('process.env.ROUND_SALT', process.env.ROUND_SALT || 10);
    return 'Hello World!!!!!!';
  }
}
