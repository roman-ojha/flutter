import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print("Answer 1 chosen!");
  }

  final question = [
    'What\'s you favriot color?',
    "What\'s your favorite animal?"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        /*
            # Different Types of Widgets
              => Output & Input (Visible)
                  -> Ex: RaisedButton(),Text(),Card(),....
                  -> these are the widget that we see on the screen
              => Layout & Control (Invisible, Indirectly visible)
                  -> This help us on layout and control that how widget tree  beheave
                  -> EX: Row(),Column(),ListView(),......
              => we also have the 'Container()' weidget which full into both categori
        */
        body: Column(
          // here 'Column()' is the invisible layout widget that render weidget in a column
          // which has the 'children:' named argument which takes a list of widgets
          // here '<widget>' tell that list is of Widget
          children: /*<Widget>*/ [
            Text("The question!"),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion,
              // here we don't have to pass 'answerQuestion()' rather we will pass 'answerQuestion'
              // because 'answerQuestion()' will call the function when the code are executed by the compiler
              // but after passing pointer 'answerQuestion' function will only will call when button will Pressed
            ),
            ElevatedButton(
              child: Text("Answer 2"),
              onPressed: () => print("Answer 2 Chosen!"),
              // or we can use the anonymous function
            ),
            ElevatedButton(
              child: Text("Answer 3"),
              onPressed: () => print("Answer 3 Chosen!"),
            ),
          ],
        ),
        // 'ElevatedButton()' is the weidget which will create the Button
        // and 'ElevatedButton()' takes the named argument which is 'child:' , 'onPressed:'
        // 'child:' is the content inside the button
        // 'onPressed:' is the function which will be executed when the the button is Pressed
      ),
    );
  }
}
