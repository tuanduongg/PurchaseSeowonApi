import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.setGlobalPrefix('api');
  const configService = app.get(ConfigService);
  const port = configService.get('PORT') || 8000;
  app.enableCors();
  await app.listen(port);
}
bootstrap();
