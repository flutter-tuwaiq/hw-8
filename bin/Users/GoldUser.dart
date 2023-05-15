import 'dart:io';
import 'dart:math';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:http_parser/http_parser.dart';

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// Middleware //////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

Middleware checkAuth() => (innerHandler) => (Request req) {
      final header = req.headers;

      if (header['User-Type'] != 'Gold') {
        return Response.unauthorized(
          'Sorry, you have to upgrade your account.',
        );
      }

      return innerHandler(req);
    };

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Route /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class GoldUser {
  Handler get handler {
    final router = Router()
      ..post('/postimage', goldPostImage)
      ..post('/postvideo', goldPostVideo);

    final pipeline = Pipeline().addMiddleware(checkAuth()).addHandler(router);

    return pipeline;
  }
}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// Response ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////// Post Image //////////////////////////////////

goldPostImage(Request req) async {
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'image/png' &&
      contentType.mimeType != 'image/jpg' &&
      contentType.mimeType != 'image/gif') {
    return Response.badRequest(body: 'Please enter a valid Image');
  }
  print(contentType.type);

  final body = await req.read().expand((bit) => bit).toList();
  final id = Random().nextInt(99999999);
  final file = File('bin/images/gold_user_$id.${contentType.subtype}');

  await file.writeAsBytes(body);
  print(body);

  return Response.ok("Your image has been published successfully!");
}

////////////////////////////////// Post Video //////////////////////////////////

goldPostVideo(Request req) async {
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'video/mp4') {
    return Response.badRequest(body: 'Please enter a valid Video');
  }
  print(contentType.type);

  final body = await req.read().expand((bit) => bit).toList();
  final id = Random().nextInt(99999999);
  final file = File('bin/images/gold_user_$id.${contentType.subtype}');

  await file.writeAsBytes(body);
  print(body);

  return Response.ok("Your video has been published successfully!");
}
