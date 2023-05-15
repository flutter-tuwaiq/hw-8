import 'package:shelf/shelf.dart';
import '../server.dart';


Response rootHandler(Request req) {
  
  return Response.ok('Hello, World!\n');
}
