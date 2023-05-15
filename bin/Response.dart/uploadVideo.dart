import 'dart:io';
import 'dart:math';
import 'package:http_parser/http_parser.dart';

import 'package:shelf/shelf.dart';

uploadVideo(Request req, String video_name) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    // Checking media type
    print(contentType.mimeType);

    // Implement video validation to ensure the uploaded file is indeed of format mp4
    if (contentType.mimeType != 'video/mp4') {
      return Response.forbidden("Unsupported media type");
    }

    final body = await req.read().expand((bit) => bit).toList();

    // The use of "video_name" is to allow users to specify a preferred filename for the uploaded video
    final file = File('bin/videos/$video_name.${contentType.subtype}');
    await file.writeAsBytes(body);

    // checking to see the output of "body"
    print(body);

    return Response.ok("Video uploaded successfully!");
  } catch (e) {
    print(e);
  }
}
