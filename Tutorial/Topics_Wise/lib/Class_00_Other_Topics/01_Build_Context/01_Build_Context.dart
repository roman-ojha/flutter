import 'package:flutter/material.dart';

class FlutterBuildContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    void main(){
        A().func1("roman");
    }
    class A{
      void func1(String text){
        // here we are getting the argument as 'text' so that we can use that text value it means that 'text' will help to define the 'func1'
        // and we can understand that right now in that function what is going on
        // and here we are accepting the 'text' that is comming as an argument
        print(text);
      }
    }

    -> just like that 'BuildContext' will handle the newly(third person) added widget to say that is going on in the widget tree and where is the location of that new widget
    -> By the defination:
      -> 'BuildContext' will handle to the location of a widget in the widget tree
    -> but useally we are not using this 'context' in our project
        -> we will use this when we are working on multiple screen so that 'context' hold the information about the context or what is going on in that screen
    => Build context is always trying to answer the question "Where am i as a widget in the whole widget tree located " or in other words "What's going around me where am i located ring now in the app"
    -> Docs: https://api.flutter.dev/flutter/widgets/BuildContext-class.html
  */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build Context"),
      ),
    );
  }
}
