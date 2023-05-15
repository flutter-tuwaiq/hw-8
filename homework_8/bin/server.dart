import 'dart:async';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';
import 'responses/media_res.dart';

final _router = Router()
  ..get('/', rootHandler)
  //  I allowed users to specify the preferred filename for the uploaded image by adding it to the route.
  ..post('/upload_image/<file_name>', uploadImageHandler)
  ..post('/upload_video/<file_name>', uploadVideoHandler);

void main() {
  withHotreload(() => createServer());
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');

  return server;
}
