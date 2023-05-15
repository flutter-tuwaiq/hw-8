import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

Middleware checkHeaderJson = (innerHandler) => (Request req) {
      final header = req.headers;
      final contentType = MediaType.parse(req.headers['Content-Type']!);

      print(header);
      var listTypes = ['image/png', 'image/jpeg', 'image/jpg'];

      if (!listTypes.contains(contentType.mimeType)) {
        return Response.forbidden(
            'Invalid file format!, please images with extension(png,jpeg,jpg)');
      }

      return innerHandler(req);
    };
