import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
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
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView builder"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  number = number + 1;
                });
              },
              child: Text("Add ListTile"),
            ),
            ListView.builder(
              physics: ScrollPhysics(parent: null),
              // this will help us the not scroll the listView because we had use the 'SingleChildScrollView' as the main parent and we are scrolling all widget through that widget
              shrinkWrap: true,
              // shrinkWrap: true will help us to put the listView inside the column widget
              itemCount: number,
              // here itemCount is the number which will be build by the builder into the listView and that item is the return widget that we had return in the 'itemBuilder'
              itemBuilder: (context, index) {
                // itemBuilder require 'Widget Function(BuildContext, int)'
                // 'index' is the current number which is building right now
                return Container(
                  color: index % 2 == 0 ? Colors.blue : Colors.orange,
                  child: ListTile(
                    trailing: Icon(Icons.device_hub),
                    title: Text("Hello"),
                    subtitle: Text("subtitle"),
                    leading: Icon(Icons.local_activity),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
