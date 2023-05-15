import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:http_parser/http_parser.dart';
import 'package:image_compression/image_compression.dart';
import 'package:shelf/shelf.dart';

imageResponse(Request req) async {
  // check if content type is an image type
  final contentType = MediaType.parse(req.headers["Content-Type"]!);

  if (contentType.mimeType != 'image/png' &&
      contentType.mimeType != 'image/jpeg') {
    return Response.forbidden("«Sorry! This is invalid file format");
  }

  final chunks = <List<int>>[];
  final completer = Completer<List<int>>();

  // read the request body as bytes, and store it in chunks list
  final stream = req.read().listen((event) {
    chunks.add(event);
  });

  stream.onError((error) {
    return Response.forbidden("Oops! Something went wrong");
  });

  // to merge all chunks lists in completer
  stream.onDone(() {
    completer.complete(chunks.expand((bit) => bit).toList());
  });

  final bytesImage = await completer.future;

  // check if user send name for image then set it in (imageName), if NOT set a random number
  final imageName = req.headers['Image_Name'] ?? Random().nextInt(9999999);

  File imageFile = File(
    'bin/images/$imageName.${contentType.subtype}',
  ); // To specify the extension of the image

  await imageFile.writeAsBytes(bytesImage);

  // if image size more than 2 MB then compress
  if (await imageFile.lengthSync() > 2000000) {
    final input = ImageFile(
      rawBytes: imageFile.readAsBytesSync(),
      filePath: imageFile.path,
    );
    final output = await compressInQueue(ImageFileConfiguration(input: input));
    print(await imageFile.lengthSync());
    print(output.sizeInBytes);
  }

  // ---- ok
  return Response.ok(
    "Image is uploaded successfully",
    headers: {"Content-Type": "Application/json"},
  );
}
