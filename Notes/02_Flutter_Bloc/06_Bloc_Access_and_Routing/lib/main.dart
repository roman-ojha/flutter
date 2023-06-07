import 'package:blocconcepts/logic/cubit/counter_cubit.dart';
import 'package:blocconcepts/presentation/router/app_router.dart';
import 'package:blocconcepts/presentation/screens/second_screen.dart';
import 'package:blocconcepts/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  // because we have to provide the same "CounterCubit" to multiple route we have to create the variable which will store the single instance and will provide to multiple route

  // For Generated Route:
  // we have to create AppRouter Class Instance
  final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _counterCubit.close();
    // NOTE: 'BlocProvider.value' wouldn't close the provider bloc automatically we will need to close manually where we create it, it means that in 'dispose' method

    // For Generated route:
    _appRouter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // now here we have to provide the 'BlocProvider'
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // Any application Must Have a default home route
        // The route name for the default route must be '/'
        '/': (context) => BlocProvider.value(
              // when we have to provide existing instance to different screen we have to use 'BlocProvider.value' rather then 'BlocProvider'
              // NOTE: 'BlocProvider.value' wouldn't close the provider bloc automatically we will need to close manually where we create it, it means that in 'dispose' method
              value: _counterCubit,
              child: const HomeScreen(
                title: "HomeScreen",
                color: Colors.blueAccent,
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: "SecondScreen",
                color: Colors.redAccent,
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                title: "ThirdScreen",
                color: Colors.greenAccent,
              ),
            ),
      },
      // Generate Route:
      // for generate route we don't need 'route:' parameter but for tutorial purposes we will keep it
      onGenerateRoute: _appRouter.onGenerateroute,
    );
  }
}
