import 'package:chat_app/pages/home.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

class Routes {
  static String root = "/:roomId";
  static void configureRoutes(fluro.Router router) {
    router.define(root, handler: rootHandler);
  }
}

var rootHandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  var roomId = params["roomId"].first;
  if (roomId.isNotEmpty && roomId != '/')
    return HomePage(
      room: roomId,
    );
  return HomePage();
});
