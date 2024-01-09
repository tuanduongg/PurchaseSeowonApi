import { Controller, Get, Param, Res } from '@nestjs/common';
import { FileService } from './file.service';
import { Response, Request } from 'express';
import * as path from 'path';
import * as fs from 'fs';
import { join } from 'path';

@Controller('/files')
export class FileController {
  constructor(private readonly fileService: FileService) {}

  @Get('/:filename')
  getFile(@Param('filename') filename: string, @Res() res: Response) {
    // console.log('fileName', filename);
    // console.log('__dirname', __dirname);
    // console.log('join(__dirname)', join(__dirname, '..', 'public'));

    try {
      const filePath = path
        .join(__dirname, '../public', `${filename}`)
        .replace('\\dist\\src', '');
      console.log('filePath', filePath);
      // Check if the file exists
      if (!fs.existsSync(filePath)) {
        return res.status(404).send('File not found');
      }

      // Read the file and send it in the response
      const fileStream = fs.createReadStream(filePath);
      fileStream.pipe(res);
    } catch (error) {
      console.error('Error retrieving file:', error);
      return res.status(500).send('Error retrieving file');
    }
  }
}
