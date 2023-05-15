import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

// Implement image validation to ensure the uploaded file is indeed an image.
Middleware checkImage() => (innerHandler) => (Request req) {
      try {
        final contentType = MediaType.parse(req.headers["Content-Type"]!);
        if (contentType.mimeType != 'image/png' &&
            contentType.mimeType != 'image/jpeg') {
              
          return Response.forbidden("Error! only accepted format as JPEG and PNG");
        }

        return innerHandler(req);
      } catch (error) {
        return Response.forbidden("Error");
      }
    };
