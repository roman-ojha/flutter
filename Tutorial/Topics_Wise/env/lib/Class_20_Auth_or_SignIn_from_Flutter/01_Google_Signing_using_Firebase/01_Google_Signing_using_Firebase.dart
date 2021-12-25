/*
  -> here we are going to use Getx Statemanagement to store the information of the use that we have got form the signIn
    -> flutter pub add get
    -> so  for that we will create a login_controller.dart

  -> to make a google auth feature we will going to use firebase so for that:
    -> firstly create the project in firebase 
    -> firstly we will create the ios application:
        -> now go the file ios/Runner/info.plist
            -> and find:
              -> <key>CFBundleIdentifier</key>
	                <string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
              -> and if it have: $(PRODUCT_BUNDLE_IDENTIFIER) then replace with your package name:
              -> com.roman.env
              -> if you want to set the ios package name when you are creating a project then create like this:
              -> flutter create --org com.yourdomain appname
        -> and now we know the package name of ios: com.roman.env
    -> filled ios application in firebase and register 
    -> now download the info.plist
        -> this file content all the information about the application so will bring the file in our application
        -> and add the file inside 'ios/' folder
    -> now we have to go to the runnser/info.plist and past the given code from source: https://pub.dev/packages/google_sign_in
            -> <key>CFBundleURLTypes</key>
              <array>
                <dict>
                  <key>CFBundleTypeRole</key>
                  <string>Editor</string>
                  <key>CFBundleURLSchemes</key>
                  <array>
                    <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
                    <string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>
                  </array>
                </dict>
              </array>
    -> and in <string></string> we have to reversed id it means we have to copy the informatin from 'GoogleService-info.plist' and past it in the <string>{inside}</string> in info.plist
    -> now let's install the package which is required for the feature:
      -> flutter pub add google_sign_in : https://pub.dev/packages/google_sign_in
    -> now let's go to the login_page.dart
    -> now we will go to google cloud console and we will open the project that we had created in firebase
    -> and we will go to OAuth consent screen and filled the required form and after all published the app

  
  => Android implementation:
    -> first let's go to the firebase accout and create android application
    -> then we will go to android/app/build.gradle and find the package name of the application:
        -> defaultConfig {
        applicationId "com.example.env"}
    -> after this we have to add 'SHA1 fingerprint' for that we will go to terminal and in android path:
      ->./gradlew signinReport
      -> if it didn't work in terminal then write it in git bash and you will find:
        -> SHA1:A1:69:31:C7:1A:AA:56:C6:47:96:C1:6F:C3:62:ED:A2:8C:43:C1:0E
      -> this we will going to put in our firebase console and register it
      -> now we will going to download the google service file
      -> and we will going to past it inside the app folder
      -> we are good to go
    
  => Web implementatoin:
    -> lets go to firebase and create a web application:
    -> after that we have to add meta data inside the index.html file in web/index.html
      -> <meta name="google-signin-client_id" content="YOUR_GOOGLE_SIGN_IN_OAUTH_CLIENT_ID.apps.googleusercontent.com">
      -> documentation: https://pub.dev/packages/google_sign_in_web
    -> and after that we will go to google cloud cosole and in Credential in weclien we will copy the 'Client ID'  past inside 'content' <meta name="" content=<past>>
    -> now in googel cloud platform we have spacify the spacific port to run this application
    -> so we will write in terminal:
      -> flutter run -d chrome --web-hostname localhost --web-port 5000
    -> as we are good to go

NOTE: add these GoogleServices into the .gitignore
*/

import 'package:env/Class_20_Auth_or_SignIn_from_Flutter/01_Google_Signing_using_Firebase/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class GoogleSignInUsingFirebase extends StatelessWidget {
  const GoogleSignInUsingFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
