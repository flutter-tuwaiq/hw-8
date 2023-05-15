import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../middleware/checkImage.dart';
import '../response/uploadImage.dart';


class ImageRout{
  Handler get imageRouter{
  final router = Router()
..post('/postimage',uploadImage);

final pipline = Pipeline().addMiddleware(checkImage()).addHandler(router);

return pipline;
}}