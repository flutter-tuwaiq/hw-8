// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';

uploadVideo(Request req) async {
  try {
    final body = await req.read().expand((bit) => bit).toList();
    final contentType = MediaType.parse(req.headers['Content_Type']!);
    final file = File(
      'bin/videos/video.${contentType.subtype}',
    ); //Store video in its folder

    if (contentType.mimeType != 'video/mp4') {
      return Response.forbidden(
        'Invalid video format',
      ); //If the format of video not mp4
    }

    file.writeAsBytes(body);

    return Response.ok('video uploaded successfully');
  } catch (e) {
    print(e);
  }
}
