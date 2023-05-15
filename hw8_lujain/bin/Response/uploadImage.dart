// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';
import 'package:image_compression/image_compression.dart';

uploadImage(Request req, String name) async {
  try {
    final body =
        await req.read().expand((bit) => bit).toList(); //Read image as a bit
    final contentType = MediaType.parse(req.headers[
        'Content_Type']!); //Store the format of image "jpeg, png, ....."
    final imageFile =
        File('bin/images/$name.${contentType.subtype}'); //path of image folder
    final imageCompressed =
        File('bin/images/${name}Compressed.${contentType.subtype}');
    final input = ImageFile(
      rawBytes: imageFile.readAsBytesSync(),
      filePath: imageCompressed
          .path, //compress the image and store with different name
    );

    compress(ImageFileConfiguration(input: input));

    if (contentType.mimeType != 'image/png' &&
        contentType.mimeType != 'image/jpeg') {
      return Response.forbidden(
        'Invalid image format',
      ); //If the format of image not jpeg and png
    }

    imageFile.writeAsBytes(body);
    imageCompressed.writeAsBytes(body);

    return Response.ok('Image uploaded successfully');
  } catch (e) {
    print(e);
  }
}
