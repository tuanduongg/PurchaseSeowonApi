import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule, TypeOrmModuleAsyncOptions } from '@nestjs/typeorm';
import { ConnectionOptions, createConnection } from 'typeorm';
import { UserModule } from './user/user.module';
import { AuthModule } from './auth/auth.module';
import { ProductModule } from './product/product.module';
import { CategoryModule } from './category/category.module';
import { ImageModule } from './image/image.module';
import { DepartmentModule } from './department/department.module';
import { OrderModule } from './order/order.module';
import { FileModule } from './file/file.module';
import { UnitModule } from './unit/unit.module';
import { StatusModule } from './status/status.module';

@Module({
  imports: [
    // ServeStaticModule.forRoot({
    //   serveRoot: '/public',
    //   rootPath: join(__dirname, '..', 'public'), // <-- path to the static files
    // }),
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      useFactory: async (): Promise<ConnectionOptions> => {
        const connectionOptions: ConnectionOptions = {
          type: 'mssql',
          host: `${process.env.DB_HOST}`,
          port: parseInt(process.env.DB_PORT),
          username: `${process.env.DB_USERNAME}`,
          password: `${process.env.DB_PASSWORD}`,
          database: `${process.env.DB_DATABASE}`,
<<<<<<< HEAD
          options: { trustServerCertificate: true }, //for mssql
=======
          options: { trustServerCertificate: true },
>>>>>>> ff5ab819a2365129e509a6286a692ec557f04233
          entities: [__dirname + '/../**/*.entity.js'],
          // logging: true, // for mysql
          requestTimeout: 30000, //for mssql
          synchronize: true,
          pool: {
            //for mssql
            max: 10,
            min: 0,
            idleTimeoutMillis: 30000,
          },
        };

        const connection = await createConnection(connectionOptions);
        console.log('Connected to the database', connection.options.database);

        return connectionOptions;
      },
    } as TypeOrmModuleAsyncOptions),
    // ServeStaticModule.forRoot({
    //   rootPath: join(__dirname, '..', 'public'),
    //   serveStaticOptions: { index: false },
    // }),
    AuthModule,
    UserModule,
    ProductModule,
    CategoryModule,
    ImageModule,
    DepartmentModule,
    OrderModule,
    FileModule,
    UnitModule,
    ImageModule,
    StatusModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
