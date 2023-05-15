import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';


import 'dart:io';

import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'Response/Creat_image.dart';

// Run this app with --enable-vm-service (or use debug run)
void main() async {
  withHotreload(() => createServer());

}

Future<HttpServer> createServer() async{
  final ip = InternetAddress.anyIPv4;
  
  final router = Router()
  ..post("/image", Creat_image);
  
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(router, ip, port);
  print('Server listening on port ${server.port}');

  return server;
}
