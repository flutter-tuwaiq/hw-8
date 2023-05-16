import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../user_Raut/userRaut.dart';
import '../user_Raut/uservedio.dart';

class baseraute {
  Handler get mybaseraut {
    final Router route = Router()
      ..mount('/user', userRaut().myuserraut)
      ..mount('/userviduo', uservedio().myuserraut);

    return route;
  }
}
