import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/upload_v.dart';

class R_video {
Handler get handler {
 final router = Router()

  ..post('/upload_v', upload_v);

//final pipline = Pipeline().addMiddleware(check_image()).addHandler(router);

 return router;

}
}

 