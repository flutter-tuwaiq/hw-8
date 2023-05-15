import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:shelf/shelf.dart';

uploadVideo(Request req, String video) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    if (contentType.mimeType != 'video/mp4') {
      return Response.forbidden("Unsupported media type");
    }

    final body = await req.read().expand((bit) => bit).toList();

    final file = File('bin/videos/$video.${contentType.subtype}');
    await file.writeAsBytes(body);

    return Response.ok("Image uploaded successfully!");
  } catch (e) {
    print(e);
  }
}
