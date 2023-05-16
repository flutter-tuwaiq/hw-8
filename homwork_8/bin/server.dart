import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

import 'responses/uploding.dart';
import 'responses/uplodingVideo.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
..post("/creat",postImage)

..post("/creatv",postvideo);


Response _rootHandler(Request _) {
  return Response.ok('server is working');
}





void main() async => withHotreload(() => createServer());

Future<HttpServer> createServer()async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(_router, ip, port);
print("server is on at http://${server.address.host}:${server.port}");
  return server;

}