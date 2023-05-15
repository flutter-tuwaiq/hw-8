import 'package:shelf/shelf.dart';

Response rootHandler(Request _) {
  return Response.ok('Hello, World!\n');
}
