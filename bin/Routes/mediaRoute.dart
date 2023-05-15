// ignore_for_file: file_names

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../Responses/Base/uploadMediaResponse.dart';

// ignore: camel_case_types
class mediaRoute{
  Handler get handler {
    final router = Router()
      ..post('/image', uploadImageResponse)
      ..post('/video', uploadVideoResponse)
      ;
    final pipline = Pipeline().addHandler(router);

    return pipline;
  }
}
