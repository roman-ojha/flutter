/*
  -> to use a custom icon we have to go to https://www.fluttericon.com/
  -> and chose icon or drag an icon into the website and we can edit the icon there
  -> and the we have to change the class name of the icon
      -> now we will going to get file:
          -> fonts
                - <Icon_Name>.ttf
            -config
            -<Icon_Name>.dart
          
      -> now drag a <Icon_Name>.tff file in assets/fonts folder
      -> now we will create a folder in lib/assets/icons called assets
      -> and drag a dart file into that lib/assets/icons a dart file

      -> and import this in pubspec.yaml:
          -> fonts:
              - family: FacebookIcon
                fonts:
                 - asset: assets/fonts/FacebookIcon.ttf
*/

import 'package:flutter/material.dart';

// import custom icon
import 'assets/icons/facebook_icon.dart';

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
                    FacebookIcon.facebook_icon,
                    // here we are using the custom icon
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
