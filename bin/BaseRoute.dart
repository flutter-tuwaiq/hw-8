import 'package:shelf_router/shelf_router.dart';

import 'checkServer.dart';
import 'Users/BlueUser.dart';
import 'Users/GoldUser.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', checkServer)
      ..mount('/blue', BlueUser().handler)
      ..mount('/gold', GoldUser().handler);

    return router;
  }
}
