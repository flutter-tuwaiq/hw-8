// ignore_for_file: depend_on_referenced_packages, file_names, non_constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'package:shelf/shelf.dart';

import 'package:http_parser/http_parser.dart';

// Upload Image Response: check if all required data is recived and add them
uploadImageResponse(Request req) async {
  try {
    final MediaType ContentType = MediaType.parse(req.headers["Content-Type"]!);

    // File type validation
    if (ContentType.type != "image") {
      return Response.forbidden("the file is not of type image");
    }
    if (ContentType.mimeType != "image/png" &&
        ContentType.mimeType != "image/jpeg") {
      return Response.forbidden("unspoorted file type");
    }

    final completer = Completer<List<int>>();
    final chunks = <List<int>>[];

    // Streamer listener
    req.read().listen(
      (event) {
        chunks.add(event);
      },
      onDone: () {
        completer.complete(chunks.expand((bit) => bit).toList());
      },
      onError: (error) {
        return Response.forbidden("error loding...");
      },
    );

    // Add image to database
    final bytesImage = await completer.future;
    final time = DateTime.now();
    final file = File('bin/images/$time.${ContentType.subtype}');
    await file.writeAsBytes(bytesImage);

    return Response.ok("Uploaded image");
  } catch (error) {
    return Response.notFound('Unexpected error occured...');
  }
}

// Upload video Response: check if all required data is recived and add them
uploadVideoResponse(Request req) async {
  try {
    final MediaType ContentType = MediaType.parse(req.headers["Content-Type"]!);

    // File type validation
    if (ContentType.type != "video") {
      return Response.forbidden("the file is not of type video");
    }
    if (ContentType.mimeType != "video/mp4" &&
        ContentType.mimeType != "video/wmv") {
      return Response.forbidden("unspoorted file type");
    }

    final completer = Completer<List<int>>();
    final chunks = <List<int>>[];

    // Streamer listener
    req.read().listen(
      (event) {
        chunks.add(event);
      },
      onDone: () {
        completer.complete(chunks.expand((bit) => bit).toList());
      },
      onError: (error) {
        return Response.forbidden("error loding...");
      },
    );

    // Add image to database
    final bytesImage = await completer.future;
    final time = DateTime.now();
    final file = File('bin/images/$time.${ContentType.subtype}');
    await file.writeAsBytes(bytesImage);

    return Response.ok("Uploaded image");
  } catch (error) {
    return Response.notFound('Unexpected error occured...');
  }
}
