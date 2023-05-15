import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';

//Create an endpoint that accepts POST requests for uploading a video
uploadvideo(Request req) async {
  try {
    final completer = Completer<List<int>>();
    final chunks = <List<int>>[];
    final stream = req.read().listen((event) {
      chunks.add(event);
    });
    stream.onError((error) {
      return Response.forbidden("error loading");
    });
    stream.onDone(() {
      completer.complete(chunks.expand((bit) => bit).toList());
    });
    final byteVideo = await completer.future;
    final contentType = MediaType.parse(req.headers["Content-Type"]!);
    final id = Random().nextInt(999999); 
    final file = File("bin/video/$id.${contentType.subtype}");
    await file.writeAsBytes(byteVideo);
    print(byteVideo);

    return Response.ok("The video has been sent successfully");
  } catch (error) {
    print(error);
  }
}
