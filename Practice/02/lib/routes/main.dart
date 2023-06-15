import 'package:flutter/material.dart';
import 'package:practice02/screen/home.dart';
import 'package:practice02/screen/second.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => const HomePage(title: "Home Page"),
    '/second': (_) => SecondPage(
          title: "Second Page",
        ),
  };

  Map<String, Widget Function(BuildContext)> getRoute() {
    return routes;
  }
}
