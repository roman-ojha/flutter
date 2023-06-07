import 'package:flutter/material.dart';

// here we also have to import the main page
import 'RoutePageThirdWay.dart';

// Encapsulating the whole routing login in this file or class
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting argument passed in while calling navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => SecondPage(data: args),
          );
        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error"),
        ),
      );
    },
  );
}
