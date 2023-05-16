import 'dart:math';

import 'package:shelf/shelf.dart';

class midalwire {
  var nameimag;

  Middleware nameimege() => (innerHandler) => (Request req) {
        final nameimage = req.headers;
        if (nameimage["nameimeg"] == null) {
          nameimag = Random().nextInt(99999);
          return innerHandler(req);
        } else if (nameimage["nameimeg"] != null) {
          nameimag = nameimage["nameimeg"];

          return innerHandler(req);
        }
        return innerHandler(req);
      };
}
