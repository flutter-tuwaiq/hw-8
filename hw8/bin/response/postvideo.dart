

import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import "dart:io";
import 'dart:math';
import 'package:http_parser/http_parser.dart';
postvideo (Request req ) async{
  try {
    final completer =Completer<List<int>>();
    final  Chunks =<List<int>>[];
    final stream =req.read().listen((event) {Chunks.add(event);
    });
   stream.onError((e){
     print(e);
      return Response.forbidden("error one");
      }); 
   stream.onDone((){
    completer.complete(Chunks.expand((bit)=>bit).toList());
   });
    final  bytesvideo =await completer.future;
    //final contentType= MediaType.parse(req.headers["contentType"]!);
  final id =Random().nextInt(999999);
  final file =File('bin/vidoe/$id.mov');
 await file.writeAsBytes(bytesvideo);
 print(bytesvideo);
return Response.ok("video uploaded successfully");
}
catch(e)
{return Response.ok("error");}
}
