// Configure routes.
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../mainRes/mainRes.dart';
import '../server.dart';
import 'imageRouter.dart';

class mainrouter{
  Router get router{
    final router =Router()
    ..get('/', rootHandler)    
    ..mount('/image', imageRoute().handler)
    ..all('/<|.*',(Request req){
    
    return Response.notFound('not found page');
    
  });
  
  return router;
}
}