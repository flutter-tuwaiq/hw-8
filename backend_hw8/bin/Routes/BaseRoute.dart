import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Respones/rootHandler.dart';
import '../Respones/imageResponse.dart';
import '../Respones/videoResponse.dart';

class BaseRoute {
  Router get route {
    final router = Router()
      ..get('/', rootHandler)
      ..post('/image', imageResponse)
      ..post('/video', videoResponse)
      ..all('/<name|.*>', (Request req) {
        return Response.notFound("Not Found Page! please try again.");
      });

    return router;
  }
}
