import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Image } from 'src/entity/image.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ImageService {
  constructor(
    @InjectRepository(Image)
    private categoryRepo: Repository<Image>,
  ) {}

  async fake() {
    return this.categoryRepo.insert([
      {
        productID: 'da025e2f-09aa-ee11-a1ca-04d9f5c9d2eb',
        url: '/image.jpg',
      },
      {
        productID: 'db025e2f-09aa-ee11-a1ca-04d9f5c9d2eb',
        url: '/image2.jpg',
      },
    ]);
  }
  async getAll() {
    return await this.categoryRepo.find({});
  }
}
