
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'UserUploadRoute.dart';

class BaseRoute {

    Handler get handler {

        final router = Router()
        // ..get('/', rootHandler)
        ..mount("/upload", UserUploadRoute().handler)
        ..all('/<name|.*>', (Request req) {
          return Response.notFound("Not Found ! please try again.");
        });
    
      return router;
  }
}

