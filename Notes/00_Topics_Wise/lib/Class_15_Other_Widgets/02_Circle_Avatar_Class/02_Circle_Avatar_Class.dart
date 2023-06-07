import 'package:flutter/material.dart';

class CircleAvatarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CircleAvatar"),
        ),
        body: Container(
          child: ListView(
            children: [
              // CircleAvatar -------------------------------
              CircleAvatar(
                foregroundColor: Colors.white,
                maxRadius: 200,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                child: Text(
                  "User",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
