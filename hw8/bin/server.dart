import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'routers/baseRout.dart';




void main(){
  withHotreload(() => createServer());
}
Future<HttpServer> createServer() async{
 final ip =InternetAddress.anyIPv4; 

final pipline = Pipeline()
.addMiddleware(logRequests()).addHandler(BaseRout().baseRout);

 final port = int.parse(Platform.environment["PORT"] ?? "8080"); 

 
 final server =await serve(pipline, ip, port);

 print("server is starting at http:${server.address.host}:${server.port}");

 return server;
}