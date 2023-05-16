import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'Routes/BaseRoute.dart';

void main() {
  withHotreload(() => createServer());
}


Future<HttpServer> createServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  final pipline = Pipeline().addHandler(BaseRoute().handler);
  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(pipline, ip, port);
  print('Server listening on port ${server.port}');

  return server;
}
