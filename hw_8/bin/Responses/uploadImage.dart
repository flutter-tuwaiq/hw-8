import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:shelf/shelf.dart';

uploadImage(Request req) async {
  try {
    final completer = Completer<List<int>>();
    final chunks = <List<int>>[];

    final stream = req.read().listen((event) {
      chunks.add(event);
    });

    stream.onError((error) {
      print(error);

      return Response.forbidden("error loading");
    });
    stream.onDone(() {
      completer.complete(chunks.expand((bit) => bit).toList());
    });

    final bytesImage = await completer.future;

    final id = Random().nextInt(99999);
    final file = File('bin/image/$id.png');
    await file.writeAsBytes(bytesImage);

    return Response.ok('Image uploaded secussfuly');
  } catch (error) {
    print(error);

    return Response.forbidden(
      "invalid format",
    );
  }
}
