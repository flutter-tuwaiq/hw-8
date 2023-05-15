import 'dart:async';
import 'dart:io';
import 'package:shelf/shelf.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;

Response rootHandler(Request _) {
  return Response.ok('server is working');
}

// -------------------- here is the response for uploading images. --------------------
Future<Response> uploadImageHandler(Request req, String fileName) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    if (contentType.mimeType != "image/png" &&
        contentType.mimeType != "image/jpeg") {
      return Response.badRequest(body: "Invalid file format!");
    }

    final body = await req.read().expand((bit) => bit).toList();
    File jsonFile = File('bin/images/$fileName.${contentType.subtype}');

    await jsonFile.writeAsBytes(body);

// -- this function takes the path of the image with the width and height and resize it. --
    resizeImage(path: jsonFile.path, imageWidth: 1000, imageHeight: 1000);
// ----------------------------------------------------------------------------------------

    return Response.ok("Uploaded successfully!");
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input!');
}
// -----------------------------------------------------------------------------------

// -------------------- here is the function for resizing images. --------------------
resizeImage({
  required String path,
  required int imageWidth,
  required int imageHeight,
}) async {
  final cmd = img.Command()
    ..decodeImageFile(path)
    ..copyResize(width: imageWidth, height: imageHeight)
    ..writeToFile(path);
  await cmd.executeThread();
}
// ------------------------------------------------------------------------------------

// -------------------- here is the response for uploading videos. --------------------
Future<Response> uploadVideoHandler(Request req, String fileName) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

//  --------------- I made the check for mp4 format only just to test it. ---------------
    if (contentType.mimeType != "video/mp4") {
      return Response.badRequest(body: "Invalid file format!");
    }

    final completer = Completer<List<int>>();
    final chunks = <List<int>>[];

    final stream = req.read().listen((event) {
      chunks.add(event);
    });

    stream.onDone(() {
      completer.complete(chunks.expand((bit) => bit).toList());
    });
    stream.onError((error) {
      return Response.forbidden("error");
    });

    final byteVideo = await completer.future;

    File jsonFile = File('bin/videos/$fileName.${contentType.subtype}');

    await jsonFile.writeAsBytes(byteVideo);

    return Response.ok("Uploaded successfully!");
  } catch (e) {
    print(e);
  }

  return Response.badRequest(body: 'Invalid input');
}
// ------------------------------------------------------------------------------------
