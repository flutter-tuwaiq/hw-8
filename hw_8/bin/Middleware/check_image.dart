import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

//-------------------------------------------------------
// This is middleware to check if file is image or not.
//-------------------------------------------------------
Middleware checkImage() => (innerHandler) => (Request req) {
      try {
        final contentType = MediaType.parse(req.headers["Content-Type"]!);
        if (contentType.mimeType != 'image/png' &&
            contentType.mimeType != 'image/jpeg') {
          return Response.forbidden(
            "Unspported format try (png or jpg) file",
          );
        }

        return innerHandler(req);
      } catch (error) {
        return Response.forbidden("Error");
      }
    };
