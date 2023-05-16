import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../user_Raut/userRaut.dart';

class baseraute {
  Handler get mybaseraut {
    final Router route = Router()..mount('/user', userRaut().myuserraut);

    return route;
  }
}
