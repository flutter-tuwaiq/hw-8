// ignore_for_file: file_names

import 'package:shelf/shelf.dart';

Response rootHandler(Request _) {
  return Response.ok('Hello, World!\n');
}
