// ignore_for_file: file_names

import 'package:shelf_router/shelf_router.dart';
import '../Response/rootHandler.dart';
import '../Response/uploadImage.dart';
import '../Response/uploadVideo.dart';

class BaseRoute {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)  //To check the server
      ..post('/uploadImage/<fileName>', uploadImage)  //Upload image
      ..post('/uploadvideo', uploadVideo);  //Upload video

    return router;
  }
}
