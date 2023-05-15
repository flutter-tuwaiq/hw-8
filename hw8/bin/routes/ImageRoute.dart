import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../responses/uploadImage.dart';
import '../responses/uploadVideo.dart';

class ImageRoute {
  Router get myImageRoute {
    final Router route = Router()
      ..post("/upload_image/<file_name>", uploadImage)
      ..post("/upload_video/<file_name>", uploadVideo);

    return route;
  }
}
