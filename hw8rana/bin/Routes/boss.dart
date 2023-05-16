import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Middlewars/bossMiddleware.dart';
import '../Responses/createPost.dart';

class myimage {
  Handler get handler {
    final router = Router()..post('/uploadimg', downimage);

    final pipline = Pipeline().addMiddleware(check_image()).addHandler(router);

    return pipline;
  }
}
