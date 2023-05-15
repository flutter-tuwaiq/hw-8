import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Handlers/ImageHandler.dart';
import '../base/echoHandler.dart';
import '../base/rootHandler.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..get('/echo/<message>', echoHandler)
      ..mount('/images', imageHandler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("you are try access page name ${req.url}");
      });

    return router;
  }
}
