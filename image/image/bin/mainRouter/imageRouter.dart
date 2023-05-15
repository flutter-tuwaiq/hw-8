


import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../mainMiddleware/imageMiddle.dart';
import '../mainRes/imageRes.dart';
import '../mainRes/mainRes.dart';
import '../server.dart';

class imageRoute {
  Handler get handler {
    final router = Router()
      ..post('/image' ,images );
      
    final pipeline =
        Pipeline().addMiddleware(checkImage()).addHandler(router);

    return pipeline;
  }
  
}