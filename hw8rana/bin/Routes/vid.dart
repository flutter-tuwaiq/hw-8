import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/bossMiddleware.dart';
import '../Responses/vid.dart';

class myvideo {
  Handler get handler {
    final router = Router()..post('/uplovid', downvidv);

    final pipline = Pipeline().addMiddleware(check_image()).addHandler(router);

    return router;
  }
}
