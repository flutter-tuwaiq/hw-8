import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../Responses/uploadImage.dart';
import '../Middleware/check_image.dart';

class UserRoute {
  Handler get myUserRoute {
    final route = Router()..post('/image', uploadImage);

    final pipline = Pipeline().addMiddleware(checkImage()).addHandler(route);

    return route;
  }
}
