import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Handlers/ImageHandler.dart';
import '../base/echoHandler.dart';
import '../base/rootHandler.dart';

class ImageRoute {
  Router get handler {
    final router = Router()..post('/upload', imageHandler);

    return router;
  }
}
