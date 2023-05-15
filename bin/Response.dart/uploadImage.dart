import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_compression/image_compression.dart';

import 'package:shelf/shelf.dart';

uploadImage(Request req, String image_name) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    // Checking media type
    print(contentType.mimeType);

    // Implement image validation to ensure the uploaded file is indeed of format PNG or JPEG
    if (contentType.mimeType != 'image/png' &&
        contentType.mimeType != 'image/jpeg') {
      return Response.forbidden("Unsupported media type");
    }

    final body = await req.read().expand((bit) => bit).toList();

    // The use of "image_name" is to allow users to specify a preferred filename for the uploaded image
    final file = File('bin/images/$image_name.${contentType.subtype}');
    await file.writeAsBytes(body);

    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
    );

    final compressedImage = compress(ImageFileConfiguration(input: input));

    // comparing the size of the compressed image and the original
    print('Input size = ${file.lengthSync()}');
    print('compressedImage size = ${compressedImage.sizeInBytes}');
    print("---------------");
    // checking to see the output of "body"
    print(body);

    return Response.ok("Image uploaded successfully!");
  } catch (e) {
    print(e);
  }
}
