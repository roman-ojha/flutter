import 'package:flutter/material.dart';

class FlutterButtonWidget extends StatefulWidget {
  State<FlutterButtonWidget> createState() => _FlutterButtonWidgetState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _FlutterButtonWidgetState extends State<FlutterButtonWidget> {
  String dropdownValue = 'One';
  WhyFarther selection = WhyFarther.harder;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
        ),
        body: Container(
          child: ListView(
            children: [
              // Text Button---------------------------------------
              TextButton(
                // Use text buttons on toolbars, in dialogs, or inline with other content but offset from that content with padding so that the button's presence is obvious. Text buttons do not have visible borders and must therefore rely on their position relative to other content for context. In dialogs and cards, they should be grouped together in one of the bottom corners. Avoid using text buttons where they would blend in with other content, for example in the middle of lists.
                onPressed: () {
                  print("Text Button Pressed");
                },
                // if we will use null the it is disabled
                onLongPress: () {
                  print("Text Button LongPress");
                },
                child: Text("TextButton"),
                autofocus: true,
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.red,
                  elevation: 10,
                  shadowColor: Colors.blue,
                  primary: Colors.white,
                  animationDuration: Duration(
                    seconds: 3,
                  ),
                  fixedSize: Size(10, 40),
                ),
              ),
              // Text Icon Button------------------------------
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home),
                label: Text("Icon Button"),
                 style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
              // Text Icon Image Button------------------------------
              TextButton.icon(
                onPressed: () {},
                icon: Image.asset("assets/images/img1.jpg"),
                label: Text("Icon Button"),
              ),
              // ElevatedButton ------------------------
              ElevatedButton(
                onPressed: () {},
                child: Text("ElevatedButton"),
              ),
              // ElevatedButton Icon----------------------------
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home),
                label: Text("Elevated Button Icon"),
                 style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
              ),
              // FloatingActionButton -------------------------------
              FloatingActionButton(
                onPressed: () {},
                child: Text("Floating Button"),
                backgroundColor: Colors.red,
                elevation: 10,
                foregroundColor: Colors.black87,
                splashColor: Colors.blue,
                hoverColor: Colors.yellow,
              ),
              // Extended Floating Button ------------------------------------
              FloatingActionButton.extended(
                onPressed: () {},
                label: Text("Extended Floating Button"),
              ),
              // DropDownButton ---------------------------------------------
              // DropDownButton is that like selection in html
              DropdownButton<String>(
                value: dropdownValue,
                // The value of the currently selected DropdownMenuItem.
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 3,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Three', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Icon Button ----------------------------------
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                color: Colors.red,
                padding: EdgeInsets.all(30),
                highlightColor: Colors.amber,
                focusColor: Colors.blue,
                iconSize: 40,
                splashColor: Colors.deepOrange,
                disabledColor: Colors.lightGreen,
              ),
              // InkWell Button ----------------------------
              InkWell(
                child: Text("Inkwell"),
                onTap: () {
                  print("Inkwell Tap");
                },
                highlightColor: Colors.red,
                splashColor: Colors.blue,
                focusColor: Colors.orange,
              ),
              // PopupMenuButton -----------------------------------
              PopupMenuButton<WhyFarther>(
                onSelected: (WhyFarther result) {
                  setState(() {
                    selection = result;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<WhyFarther>>[
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.harder,
                    child: Text('Working a lot harder'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.smarter,
                    child: Text('Being a lot smarter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.selfStarter,
                    child: Text('Being a self-starter'),
                  ),
                  const PopupMenuItem<WhyFarther>(
                    value: WhyFarther.tradingCharter,
                    child: Text('Placed in charge of trading charter'),
                  ),
                ],
              ),
              // OutLinedButton ----------------------------
              OutlinedButton(
                // button which have outline
                onPressed: () {},
                child: Text("OutLinedButton"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
