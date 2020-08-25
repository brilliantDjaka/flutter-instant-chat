import 'package:chat_app/pages/home.dart';
import 'package:chat_app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' as fluro;
void main() {
  fluro.Router router = fluro.Router();
  Routes.configureRoutes(router);
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    onGenerateRoute: router.generator,
  ));
}