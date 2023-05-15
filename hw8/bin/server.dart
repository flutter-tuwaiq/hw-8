import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'dart:io';
import 'Main.dart';
void main() {
  withHotreload(
    () => createServer(),
    logLevel: Level.INFO,
  );
}
Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final pipline = Pipeline().addHandler(Main().handler);
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(pipline, ip, port);
    print('Server is starting at http://${server.address.host}:${server.port}');
  return server;
}