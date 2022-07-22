import 'package:flutter/material.dart';

/*
  -> A convenience widget that wraps a number of widgets that are commonly required for material design applications.
  ->  We can access all the other components and widgets provided by Flutter SDK. Text widget, Dropdownbutton widget, AppBar widget, Scaffold widget, ListView widget, StatelessWidget, StatefulWidget, IconButton widget, TextField widget, Padding widget, ThemeData widget, etc
  ->  It builds upon a WidgetsApp by adding material-design specific functionality, such as AnimatedTheme and GridPaper.
  -> The MaterialApp configures the top-level Navigator to search for routes in the following order:
*/

class MaterialAppClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MaterialApp",
      // A one-line description used by the device to identify the app for the user.
      // On Android the titles appear above the task manager's app snapshots which are displayed when the user presses the "recent apps" button
      home: MyHomePage(),
      // The widget for the default route of the app ([Navigator.defaultRouteName], which is /).
      //This is the route that is displayed first when the application is started normally, unless [initialRoute] is specified. It's also the route that's displayed if the [initialRoute] can't be displayed.
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Using Material App we can create App theme as the default theme of app like we can define primaryColor, backgroundColor, foregroundColor, brightness, fontFamily, textTheme etc..
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen,
        backgroundColor: Colors.black,
        // Define the default font family.
        fontFamily: "Georgia",
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
          headline3: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w600),
          bodyText2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
        ),
        appBarTheme: AppBarTheme(
          // define the theme of appBar
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialAppClass'),
      ),
      body: Container(),
    );
  }
}
