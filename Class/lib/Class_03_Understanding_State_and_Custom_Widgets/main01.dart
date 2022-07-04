import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // to convert this 'StatelessWidget' to 'StatefulWidget' we can refactor it
  // by just put cursor in the widget and press 'ctrl+shift+r'
  // here 'StatefullWidget' is the combination of two class
  // first we need as 'StatefullWidget' class and 'State' class

  // now we have to create the connection between the two class by using 'createState()'
  @override
  State<StatefulWidget> createState() {
    // createState() doesn't take a argument but return the State Object which is connected to the 'StatefullWidget'
    // TO DO: implement createState
    // throw UnimplementedError();

    // and now we have to return the new MyAppState() Object
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // here 'State' class came from 'material.dart' which is the generic class
  // <MyApp> tolds flutter that 'State' belong to the 'MyApp'
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      // this setState have those data which state will going to change in the future
      // 'setState' will update the state by calling the 'build()' method again
      // but flutter will rerender those changes that happen
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  /*
      # Understanding "State"
        => In General 
            -> State is Data/Information used by your App
        => App State
            -> Autheticated User Loaded Jobs
        => Widget State
            -> Curren User Input Is a Loading Spinner being shown?
      but Previously we extend the class by StatelessWidget which doesn't have a State
  */
  /*
      # Different between Stateless and Stateful widget
          a) Stateless
              => Input Data --> Widget --> Render UI
              => Input Data (Data can change externally)
              => Render UI (Gets (re)-render when Input data changes)  
          b) Stateful
              => Input Data --> Widget->InternalState --> Render UI
              => Input Data (Data can change externally)
              => Render UI (Gets (re)-render when Input data or Local State Changes)  
  */
  @override
  Widget build(BuildContext context) {
    // here we will use 'questionIndex=0' outside the build method
    //because every single time when the build method will call we don't want it to change
    var questions = [
      'What\'s you favriot color?',
      "What\'s your favorite animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Text(questions[questionIndex]),
            // here in 'Text' we will pas the array of the question...
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: answerQuestion,
            ),
            ElevatedButton(
              child: Text("Answer 2"),
              onPressed: () => print("Answer 2 Chosen!"),
            ),
            ElevatedButton(
              child: Text("Answer 3"),
              onPressed: () => print("Answer 3 Chosen!"),
            ),
          ],
        ),
      ),
    );
  }
}
