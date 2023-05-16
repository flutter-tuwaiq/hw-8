import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../user/vido.dart';

class uservedio {
  Handler get myuserraut {
    final Router route = Router()..post("/vedi", vedio);

    return route;
  }
}
