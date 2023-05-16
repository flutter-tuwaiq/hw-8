



import 'dart:io';
import 'dart:math';

import 'package:http_parser/http_parser.dart';


import 'package:shelf/shelf.dart';



// inal body = await req.read().expand((bit) => bit).toList();

//  final id = Random().nextInt(99);
//  final contenttype = MediaType.parse(req.headers["Content-Type"]!);

//   final file = File('bin/videos/$id.${contenttype.subtype}');
//    print(body);
//    await file.writeAsBytes(body);


postvideo(Request req) async {


try {
/// check for type of video 

 final contenttype = MediaType.parse(req.headers["Content-Type"]!);

 if(contenttype.mimeType != 'video/mp4'
  && contenttype.mimeType != "video/mpeg"){

return Response.forbidden('wrong type file  ...');


  } 

  // read and write video 

   final body = await req.read().expand((bit) => bit).toList();
   final id = Random().nextInt(99);
   final file = File('bin/videos/$id.${contenttype.subtype}');
    await file.writeAsBytes(body);

     return Response.ok('UPLODING IS  DONE...');

  
  


  }
   catch (error) {
     return Response.forbidden('wrong type');


 }
}