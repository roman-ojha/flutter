import 'package:blocconcepts/logic/cubit/counter_cubit.dart';
import 'package:blocconcepts/presentation/screens/home_screen.dart';
import 'package:blocconcepts/presentation/screens/second_screen.dart';
import 'package:blocconcepts/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  void dispose() {
    _counterCubit.close();
  }

  Route onGenerateroute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
              title: "Second Screen", color: Colors.redAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
              title: "Third Screen", color: Colors.greenAccent),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
        );
    }
  }
}
