import 'package:flutter/material.dart';

class IconClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Icon Class"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                    size: 40,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 40,
                  ),
                  Icon(
                    Icons.music_note,
                    color: Colors.green,
                    size: 40,
                  ),
                  Icon(
                    Icons.beach_access_rounded,
                    size: 40,
                    color: Colors.blueAccent,
                  ),
                  Icon(
                    Icons.bedroom_baby,
                    size: 40,
                    color: Colors.cyan,
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.laptop,
                    color: Colors.blue,
                    size: 40,
                    semanticLabel: "fjdks",
                  ),
                  Icon(
                    Icons.bolt_rounded,
                    color: Colors.pink,
                    size: 40,
                  ),
                  Icon(
                    Icons.book_online_sharp,
                    color: Colors.brown,
                    size: 40,
                  ),
                  Icon(
                    Icons.mobile_off,
                    size: 40,
                    color: Colors.indigo,
                  ),
                  Icon(
                    Icons.bedroom_baby,
                    size: 40,
                    color: Colors.cyan,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
