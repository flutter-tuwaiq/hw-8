import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

// Implement image validation to ensure the uploaded file is indeed an image.
Middleware checkvideo() => (innerHandler) => (Request req) {
      try {
        final contentType = MediaType.parse(req.headers["Content-Type"]!);
        if (contentType.mimeType != 'video/mp4') {
          return Response.forbidden("Error! only accepted format as mp4");
        }

        return innerHandler(req);
      } catch (error) {
        return Response.forbidden("Error");
      }
    };
