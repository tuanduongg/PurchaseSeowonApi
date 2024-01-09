import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { join } from 'path';
import { NestExpressApplication } from '@nestjs/platform-express';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.setGlobalPrefix('api');
  // app.useStaticAssets(join(__dirname, '..', 'public'));
  app.useStaticAssets(join(__dirname, '..', 'public').replace('\\dist', ''));
  console.log('join', join(__dirname, '..', 'public'));
  const configService = app.get(ConfigService);
  const port = configService.get('PORT') || 8000;
  app.enableCors();
  await app.listen(port);
}
bootstrap();
