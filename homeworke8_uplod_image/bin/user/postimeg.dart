import 'dart:io';
import 'dart:math';

import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';

import '../midalwire/midalwire.dart';

CreatePostuser(Request req) async {
  try {
    final contentType = MediaType.parse(req.headers['Content-Type']!);
    final body = await req.read().expand((element) => element).toList();
    final nameimag = Random().nextInt(99999);

    final file = File('bin/images/ $nameimag.png');

    await file.writeAsBytes(body);

    if (contentType.mimeType != 'image/png' &&
        contentType.mimeType != 'image/jpg') {
      return Response.forbidden('Erore plase Upload image.png or image.jpg');
    }

    return Response.ok('Upload image successfully');
  } catch (e) {
    print(e);
  }
}
