/*
  => if we want to scroll multiple widget by the as the single child then we can use single child scrool view class
*/

import 'package:flutter/material.dart';

class SingleChildScrollViewClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
          title: Text('SingleChildScrollViewClass'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  "This is the container",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                // to use listView builder inside singleChildScrollView we have to use shrinkWrap:true, first we have to wrap the content of list view
                physics: ScrollPhysics(parent: null),
                // to make 'SingleChildScrollView' scrolable we have to use this physic
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    color: index % 2 == 0 ? Colors.blue : Colors.yellow,
                    child: Text(
                      "Child",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
