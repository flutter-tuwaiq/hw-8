import 'dart:io';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_compression/image_compression.dart';


postImage(Request req) async {

try {
/// check for type of image 
final contenttype = MediaType.parse(req.headers["Content-Type"]!);

if(contenttype.mimeType != 'image/png' && contenttype.mimeType != "image/jpeg"){

return Response.forbidden(" unsport type");


}
// read and write image 

 final body = await req.read().expand((bit) => bit).toList();

final id = Random().nextInt(99);
 final file = File ("bin/images/$id.png");
 await file.writeAsBytes(body);
 print(body);
resize(body);


return Response.ok("uploding is done  ");

} 
 catch(e){

  return Response.forbidden('wrong type');

}
}
// resize the image 

resize (List body)async{

final id = Random().nextInt(99);
 final file = File ("bin/images/$id.png");
  final input = ImageFile(
    rawBytes: file.readAsBytesSync(),
    filePath: file.path,
  );

  final output = compress(ImageFileConfiguration(input: input));
  print('Input size = ${file.lengthSync()}');
  print('Output size = ${output.sizeInBytes}');

 return output;

}