import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';


import '../Middlewars/check_image.dart';
import '../Responses/upload_image.dart';

class R_image {
Handler get handler {
 final router = Router()

  ..post('/upload_I', upload_image);

final pipline = Pipeline().addMiddleware(check_image()).addHandler(router);

 return pipline;

}
}

 