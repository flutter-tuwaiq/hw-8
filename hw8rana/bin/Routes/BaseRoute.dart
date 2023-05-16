import 'package:shelf_router/shelf_router.dart';

import '../Routes/boss.dart';
import '../Routes/vid.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..mount("/image", myimage().handler)
      ..mount("/video", myvideo().handler);

    return router;
  }
}
