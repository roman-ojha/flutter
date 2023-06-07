import 'package:flutter/material.dart';
import 'new_Widget.dart';

class BuilderClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text("Flutter Builder"),
      ),
      body: Column(
        children: [
          Builder(
            builder: (context) {
              return ElevatedButton(
                child: Text("Show SnackBar"),
                onPressed: () {
                  /*
                -> the builder widget helps to get control over your build context so if a widget wants to access the context of it's parent then the builder is needed
              */
                  // EX:
                  // Scaffold.of(context)
                  /*  
              => So basically the context can only get the information of it's parent widgets and not of it's child widgets and in Here we are accessing the context of the 'MyHomePage' and it can only access here 'MaterialApp' and it cannot access the 'Scaffold' because this is the child widget
              -> and build context get's only the information about it's parent widget's vertically in the widget tree
              -> here we are trying to get the information about the 'Scaffold' widget but 'BuildContext' only know the information about the widget above 'MyHomePage' not scaffold
              -> to solve the proble we have to put the builder between our 'Scaffold' and 'ElevatedButton' and this builder has it's own context which it's gives to widget which are down of 'builder' and now here we can access 'Scaffold'
              -> you can watch the picture related this defination in this folder
              */
                  Scaffold.of(context).showSnackBar(SnackBar(
                    // now here we can access the 'Scaffold' from the widget tree and create the SnackBar in the scaffold using the builder
                    content: Text("Hello world"),
                  ));
                  /*
                -> we can also use the another method to 'Access' the Scaffold without using the builder by just putting the "Elevated button " into the another file where now "Elevated button " have the 'BuildContext' so that now it can again access the Scaffold widget or the parent widget easily
                -> for this we have created the file 'new_Widget.dart'
            */
                  /*
              NOTE: it is also important to know that every widget has it's own context because every widget has a build method so this 'ElevatedButton' has also built basset and has therefore a context the scaffold also has it's own context because it has also build method
            */
                },
              );
            },
          ),
          NewWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(
          Icons.favorite,
          color: Theme.of(context).primaryColor,
          // here we have to floating action button where it can access the  context of the 'Theme' in Theme is located in the 'MaterialApp' widget which is the parent widget of the context
        ),
        onPressed: () {},
      ),
    );
  }
}
