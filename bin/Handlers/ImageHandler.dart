import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';

Future<Response> imageHandler(Request req) async {
  try {
    final body = await req.read().expand((element) => element).toList();
    final file = File('bin/images/image${DateTime.now()}.png');

    await file.writeAsBytes(body);

    

    return Response.ok('Upload image successfully');
  } catch (e) {}
  return Response.ok('Hello, World!\n');
}
