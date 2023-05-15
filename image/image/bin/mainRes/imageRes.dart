import 'dart:io';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:shelf/shelf.dart';
import '../server.dart';


images(Request req)async{
try{
  
  final ContentType=MediaType.parse(req.headers ['Content-Type']!);
  print(ContentType.mimeType);
  if(ContentType.mimeType !='image/png' && ContentType.mimeType != 'image/jpeg'){
    return Response.forbidden("403");
  }
  print(ContentType.subtype);

  final body =await req.read().expand((element) => element).toList();
  final id =Random().nextInt(999999999);
  final file=File('bin/images/$id.png${ContentType.subtype}');
 await file.writeAsBytes(body);
  print(body);

  return Response.ok('statusCode');
}catch(error){
  print(error);
}
}
