import 'dart:convert';
import 'package:shelf/shelf.dart';

List<Map> boss = [];
List<Map> bossesPosts = [];

loginResponse(Request req) async {
  final Map bosses = jsonDecode(await req.readAsString());
  for (var i in boss) {
    if (bosses["username"] == i && bosses["password"] == i) {
      return Response.ok(
        " login  successfully",
        headers: {"Content-Type": "Application/json"},
      );
    }
  }
}

signUpResponse(Request req) async {
  final Map bossSignup = jsonDecode(await req.readAsString());

  boss.add(bossSignup);

  return Response.ok(
    " signed up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}

sendPostResponse(Request req) async {
  final Map sendPost = jsonDecode(await req.readAsString());

  bossesPosts.add(sendPost);
  print(bossesPosts);

  return Response.ok(
    " post up successfully",
    headers: {"Content-Type": "Application/json"},
  );
}
