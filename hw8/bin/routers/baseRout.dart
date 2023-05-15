import 'package:shelf_router/shelf_router.dart';

import '../response/uploadImage.dart';
import '../response/uploadVideo.dart';
import 'imageRout.dart';
import 'videoRout.dart';

class BaseRout{
  Router get baseRout{
  final router = Router()
..mount(("/image"), ImageRout().imageRouter)
..mount(("/video"), VideoRout().videoRouter);

return router;
}}