// ignore_for_file: file_names
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/Base/rootHandler.dart';

import 'mediaRoute.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..mount("/uploadmedia", mediaRoute().handler)
      ..all('/<name|.*>', (Request req) {
        return Response.forbidden("you are try access page name ${req.url}");
      });

    return router;
  }
}
