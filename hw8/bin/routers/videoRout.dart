import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../middleware/checkVideo.dart';
import '../response/uploadVideo.dart';


class VideoRout{
  Handler get videoRouter{
  final router = Router()
..post('/postvideo',uploadvideo);

final pipline = Pipeline().addMiddleware(checkvideo()).addHandler(router);

return pipline;
}}