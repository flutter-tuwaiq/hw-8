import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'BaseRoute.dart';
import 'Users/BlueUser.dart';

void main() {
  withHotreload(() => createServer(), logLevel: Level.INFO);
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(BaseRoute().handler);

  final port = int.parse(Platform.environment['PORT'] ?? '8888');
  final server = await serve(pipeline, ip, port);
  print(
    'Server listening on por thttp://${server.address.host}:${server.port}',
  );

  return server;
}
