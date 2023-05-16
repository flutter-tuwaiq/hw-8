import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

downvidv(Request req) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);
    print(contentType.mimeType);
    if (contentType.mimeType != 'video/mp4') {
      return Response.forbidden("unsuported type");
    }

    print(contentType.subtype);

    final body = await req.read().expand((bit) => bit).toList();
    final id = Random().nextInt(99999999);

    final name = req.headers["name"];

    final file = File('bin/videos/$name.${contentType.subtype}');

    await file.writeAsBytes(body);

    print(body);
    return Response.ok('video uploded');
  } catch (e) {
    print(e);
    return Response.forbidden("sorry");
  }
}
