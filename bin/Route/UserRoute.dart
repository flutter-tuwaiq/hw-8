import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Response.dart/uploadImage.dart';
import '../Response.dart/uploadVideo.dart';

class UserRoute {
  Router get myUserRoute {
    final Router route = Router()
      ..post("/upload_image/<image_name>", uploadImage)
      ..post("/upload_video/<video_name>", uploadVideo);

    return route;
  }
}
