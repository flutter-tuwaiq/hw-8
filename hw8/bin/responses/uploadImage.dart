import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';
import 'package:image_compression/image_compression.dart';

uploadImage(Request req, String image) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    if (contentType.mimeType != 'image/png' &&
        contentType.mimeType != 'image/jpeg') {
      return Response.forbidden("Unsupported media type");
    }

    final body = await req.read().expand((bit) => bit).toList();

    final file = File('bin/images/$image.${contentType.subtype}');
    await file.writeAsBytes(body);

// image resize
    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
    );
    final output = await compressInQueue(ImageFileConfiguration(input: input));
    print('Input size = ${file.lengthSync()}');
    print('Output size = ${output.sizeInBytes}');

    return Response.ok("Image uploaded successfully!");
  } catch (e) {
    print(e);
  }
}
