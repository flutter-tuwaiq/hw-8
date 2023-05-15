import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';

videoResponse(Request req) async {
  // check if content type is an video type
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'video/mp4' &&
      contentType.mimeType != 'video/quicktime') {
    return Response.forbidden("Sorry! This is invalid file format");
  }

  final chunks = <List<int>>[];
  final completer = Completer<List<int>>();

  // read the request body as bytes, and store it in chunks list
  final stream = req.read().listen((event) {
    chunks.add(event);
  });

  stream.onError((error) {
    return Response.forbidden("Oops! Something went wrong");
  });

  // to merge all chunks lists in completer
  stream.onDone(() {
    completer.complete(chunks.expand((bit) => bit).toList());
  });

  final bytesVideo = await completer.future;

  // Generate a random number for video name
  final videoName = Random().nextInt(9999999);

  File videoFile = File(
    'bin/videos/$videoName.${contentType.subtype}',
  ); // To specify the extension of the video

  await videoFile.writeAsBytes(bytesVideo);

  // ----- ok
  return Response.ok(
    "Video is uploaded successfully",
    headers: {"Content-Type": "Application/json"},
  );
}
