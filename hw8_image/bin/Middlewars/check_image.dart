import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

Middleware check_image() => (innerHandler) => (Request req) {
    

//contain image/
//put in if statement all the type of supoorter image

    
      final Content_type = req.headers["Content-Type"];
      if(Content_type!.contains("image/") ){
return innerHandler(req);
      }
      
return Response.unauthorized('not suimage , sorry ');

    };
