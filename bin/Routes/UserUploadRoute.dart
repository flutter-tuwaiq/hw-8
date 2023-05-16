
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../UserResponse/UploadResponse.dart';

class UserUploadRoute {

    var upload = UploadResponse();
    Handler get handler {

        final router = Router()
        ..post("/img/<imgName>", upload.uploadImage)
        ..post("/video/<videoName>", upload.uploadVideo);

    return router;
      
  }
}
  
 
  