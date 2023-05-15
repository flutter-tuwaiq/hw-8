import 'package:shelf/shelf.dart';
import "dart:io";
import 'package:http_parser/http_parser.dart';
import 'dart:math';
postimage(Request req) async{
try{
  final contentType = MediaType.parse(req.headers["content-Type"]!);
  print(contentType.mimeType);
  if(contentType.mimeType !="image/png" && contentType.mimeType !='image/jpeg'){
    return Response.ok("invalid file");
  }
  print(contentType.subtype);
  final  body =await req.read().expand((bit)=>bit).toList();
  final id =Random().nextInt(999999);
  final file =File('bin/image/$id.${contentType.subtype}');
   await file.writeAsBytes(body);
   print(body);
   return Response.ok("image uploaded successfully");
}catch (e)
{return Response.ok("creat podt image");
}
}