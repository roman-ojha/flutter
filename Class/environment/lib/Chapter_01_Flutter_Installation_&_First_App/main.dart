/*
  # Installation:  https://flutter.dev/docs/get-started/install
    Step 01 :
      Flutter depends on these tools being available in your environment.
          *) Windows PowerShell 5.0 or newer (this is pre-installed with Windows 10)
          *) Git for Windows 2.x, with the Use Git from the Windows Command Prompt option.
    Step 02:
        -> Install Flutter SDK:
            SDK(Software development kit)
        -> Extract it 
        -> if you want to open the flutter console open the flutter folder and run 'Flutter Console'
    Step 03:
        -> you can put the flutter folder in C directory
        -> now put the bin floder of flutter in environment variable
        -> now you can type in cmd
            -> flutter
            -> flutter --version
    Step 04:
        -> Install Android Studio
    Step 05: Create Projcet by openning cmd
        -> flutter create <Project_Name>
        -> flutter create --version
    Step 06:
        -> Open project in android studio
        -> Install the required plugins
        -> configure the plugin
        -> Install Google Usb Driver from the sdk manager
    Step 07: Include Android sdk in environment variable
            Variable name: ANDROID_HOME
            Variable value: C:\Users\Razz Roman\AppData\Local\Android\Sdk

            Add to Path env: 
              %ANDROID_HOME%\tools
              %ANDROID_HOME%\platform-tools
    Step 08: 
          -> Run AVD in that project form android studio
    Step 09: to run througn cmd 
          -> emulator -list-avds (to get the list of emulator)
          -> emulator -avd <emulator_Name>
          -> flutter run


    -> Flutter doctor (to see the info of flutter)
*/

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
  // this is to run the app 'MyApp()'
  // so now you have to create the class 'MyApp()' 
  // write:
    // stl to get the statelessWidget in vsCode 
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // build is the method where all the ui part came
    return MaterialApp(
      // here we are wrapping which MaterialApp
      home: Material(
        // Here we are again wrapping with Material
      child: Center(
        // Here we are wrapping again with 'center' which will put the content in center
      child: Container(
      child:Text("Welcome to 30 days of flutter"),
    )
      )),
    );
  }
}

