import 'package:blocconcepts/logic/cubit/counter_cubit.dart';
import 'package:blocconcepts/presentation/screens/home_screen.dart';
import 'package:blocconcepts/presentation/screens/second_screen.dart';
import 'package:blocconcepts/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  void dispose() {
    // since we have created cubit manually we have to close manually so we will create dispose function
    _counterCubit.close();
  }

  Route onGenerateroute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/generated':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child:
                const HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
          ),
        );
      case '/second/generated':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const SecondScreen(
                title: "Second Screen", color: Colors.redAccent),
          ),
        );
      case '/third/generated':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const ThirdScreen(
                title: "Third Screen", color: Colors.greenAccent),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child:
                const HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
          ),
        );
    }
  }
}
