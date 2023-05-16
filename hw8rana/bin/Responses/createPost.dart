import 'dart:io';
import 'dart:math';
import 'package:image_compression/image_compression.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

downimage(Request req) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);
    print(contentType.mimeType);
    if (contentType.mimeType != 'image/png' &&
        contentType.mimeType != 'image/jpeg') {
      return Response.forbidden("unposted type");
    }

    print(contentType.subtype);

    final body = await req.read().expand((bit) => bit).toList();
    final headom = req.headers["headom"];
    final file = File('bin/images/$headom .${contentType.subtype}');

    await file.writeAsBytes(body);
    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
    );
    final output = compress(ImageFileConfiguration(input: input));

    print('Input size = ${file.lengthSync()}');
    print('Output size = ${output.sizeInBytes}');

    print(body);
    return Response.ok('done! ,you upload your image !! ');
  } catch (e) {
    print(e);
    return Response.forbidden("oops! ,unposted type !! ");
  }
}
