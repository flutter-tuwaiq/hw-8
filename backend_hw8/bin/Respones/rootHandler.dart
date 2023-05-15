import 'dart:convert';

import 'package:shelf/shelf.dart';

Response rootHandler(Request _) {
  return Response.ok(jsonEncode("Hello"));
}
