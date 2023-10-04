import 'package:flutter/material.dart';
import 'package:muasume_app/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => Loading(""),
      "/loading": (context) => Loading(""),
    },
  ));
}
