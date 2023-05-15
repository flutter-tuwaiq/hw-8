//import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'R_image.dart';
import 'R_video.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount("/image", R_image().handler)
      ..mount("/video", R_video().handler);

    return router;
  }
}
