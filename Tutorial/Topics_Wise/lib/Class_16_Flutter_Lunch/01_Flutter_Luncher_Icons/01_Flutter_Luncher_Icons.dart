import 'package:flutter/material.dart';

/*
  => There are a two ways to add the flutter icons:
    1) Adding Icons Manually
        -> because our app will install on lots of devices with different size and resolutation the first things we have to do is to generate different icon size from our icon
        -> so there is a website to do that: https://appicon.co/
        -> in this website we can make a icons as per our wish  and after that generate the icon
        -> after that there is a folder for ios and android icons
        -> For Android:
            -> go to path: android/app/src/main/res/
            -> now we need to replace all the icons that we generated to the corrosping folder
        -> For IOS:
            -> go to path: ios/Runner/assets.xcasset/appicon.appiconset
            -> now again replace all the icons 
    2) Adding Icons Automatically
        -> there is a way to automatically generate the different icon sizes and place them in the correct platform folders 
        -> we can do that using the 'flutter_luncher_icons' packages
        -> install: 
              -> put in dev_dependencies : flutter_launcher_icons: ^0.9.1
        -> now we had added the package now we have to add the icon on the path:
              -> assets/icon
        -> now lets start configuring the newly install package in pubspec.yaml:
              -> flutter_icons: 
                          image_path:"assets/icon/icons.png"
                          android:true
                          ios:true
              -> for the spacific icon for android and ios:
                    -> flutter_icons: 
                          image_path_android:"assets/icon/icon.png"
                          image_path_ios:"assets/icon/icon.png"
                          android:true
                          ios:true
        -> now lets generate the icons
            -> for that lets go to terminal and run this commend:
                ->  flutter pub get
                    flutter pub run flutter_launcher_icons:main
*/
class FlutterLuncherIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
