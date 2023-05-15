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

      if (header['User-Type'] != 'Blue' && header['User-Type'] != 'Gold') {
        return Response.unauthorized(
          'Sorry you have to create an account',
        );
      }

      return innerHandler(req);
    };

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Route /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

class BlueUser {
  Handler get handler {
    final router = Router()..post('/postimage', bluePostImage);

    final pipeline = Pipeline().addMiddleware(checkAuth()).addHandler(router);

    return pipeline;
  }
}

////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// Response ///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////// Post Image //////////////////////////////////

bluePostImage(Request req) async {
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'image/png' &&
      contentType.mimeType != 'image/jpg') {
    return Response.badRequest(
      body:
          'You have to upgrade your account to be able to upload other formats.',
    );
  }
  print(contentType.type);

  final body = await req.read().expand((bit) => bit).toList();
  final id = Random().nextInt(99999999);
  final file = File('bin/images/blue_user_$id.${contentType.subtype}');

  await file.writeAsBytes(body);
  print(body);

  return Response.ok("Your image has been published successfully!");
}
