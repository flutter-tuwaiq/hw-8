import 'package:shelf_router/shelf_router.dart';

import 'UserRoute.dart';

class BaseRoute {
  Router get myBaseRoute {
    final Router route = Router()
    ..mount("/user", UserRoute().myUserRoute);

    return route;
  }
}
