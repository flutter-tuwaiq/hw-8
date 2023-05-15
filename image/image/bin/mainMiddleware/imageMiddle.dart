import 'package:shelf/shelf.dart';
import '../server.dart';


Middleware checkImage() => (innerHandler) => (Request req) {
      final header = req.headers;

    

      return innerHandler(req);
    };