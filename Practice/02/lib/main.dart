import 'package:flutter/material.dart';
import 'package:practice02/routes/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightGreen,
        // colorScheme: const ColorScheme.dark(background: Colors.black12),
        // appBarTheme: const AppBarTheme(
        //   backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        //   foregroundColor: Colors.white,
        // ),
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getRoute(),
    );
  }
}
