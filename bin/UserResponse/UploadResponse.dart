import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart';
import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';


class UploadResponse {

  uploadImage(Request request , String imgName) async {
            try {
                final contentType = MediaType.parse(request.headers["Content-Type"]!);
                if (contentType.type != "image") {
                  
                    return Response.forbidden(" not image file");

                }else
                {
                    if (contentType.mimeType != 'image/png' && contentType.mimeType != 'image/jpeg') {
                      return Response.forbidden("File extension must be .png or .jpeg"); 
                    }
                }

                  String name = imgName;
                  print(" --------------- $name");
                  final body = await request.read().expand((bit) => bit).toList();
                  final id = Random().nextInt(999999999); 
                  final file = File('bin\\_Images\\$name-$id.png');
                  await file.writeAsBytes(body);

                return Response.ok("Upload img");  
            } catch (e) {

              return Response.forbidden("Unsupported media type");
            }

}


// reSize(var img){
//   var iamge = copyResize(img , width: 3 ,height: 4);
//  return iamge;
// }


uploadVideo(Request request , String videoName) async {
   
    try {

          final contentType = MediaType.parse(request.headers["Content-Type"]!);
          if (contentType.type != "video") {
                
                return Response.forbidden(" not video file");
            } else {

                if (contentType.mimeType != 'video/mp4') {
                  return Response.forbidden("File extension must be mp4 "); 
                }
            }
          
          final body = await request.read().expand((bit) => bit).toList();
          final id = Random().nextInt(999999999); 
          final file = File('bin\\_Videos\\$videoName-$id.mp4');
        
          await file.writeAsBytes(body);

        return Response.ok("Upload Video");
      
      } catch (e) {

       return Response.forbidden("Unsupported media type"); 
     } 
   }
}