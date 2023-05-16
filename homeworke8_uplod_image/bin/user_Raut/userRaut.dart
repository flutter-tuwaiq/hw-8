import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../user/postimeg.dart';

class userRaut {
  Handler get myuserraut {
    final Router route = Router()..post("/postimage", CreatePostuser);

    return route;
  }
}
