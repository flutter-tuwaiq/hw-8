import 'package:shelf_router/shelf_router.dart';

import 'ImageRoute.dart';

class BaseRoute {
  Router get myBaseRoute {
    final Router route = Router()..mount("/user", ImageRoute().myImageRoute);

    return route;
  }
}
