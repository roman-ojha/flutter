import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var getData;
  @override
  Widget build(BuildContext context) {
    // Getting the data comming from the route page
    getData = ModalRoute.of(context)!.settings.arguments;
    // here we need the context and we will recive the argument from FirstRoutepage
    // here in this case this will return the map of data
    // we don't need setState() method because we are building the Page and at that time we are getting so is will automatically chage the state
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Second Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ElevatedButton(
              child: Text("First Page"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            Text(
              "From First Page\nName: ${getData['name']}\nID: ${getData['id']}\nGender: ${getData['gender']}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
