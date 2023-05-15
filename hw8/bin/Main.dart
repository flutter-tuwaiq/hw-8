import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'image.dart';
import 'response/postimage.dart';

class Main {
  Handler get handler {
    final router = Router()
      ..mount('/imagee',image().handlr);
     // ..all('/<name|.*>',(Request req){
     // return Response.forbidden("yor image ${req.url}");
//  });
return router;
}
}