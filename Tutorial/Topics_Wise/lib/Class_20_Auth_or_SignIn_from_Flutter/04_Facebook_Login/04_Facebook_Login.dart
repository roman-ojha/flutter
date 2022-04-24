/*
  -> flutter pub add flutter_facebook_auth : documentation (https://facebook.meedu.app/docs)
        -> go to android/app/build.gradle  and add:
            -> defaultConfig {
                  ...

                  multiDexEnabled true
              }
            -> dependencies {
                    ...

                    implementation 'com.android.support:multidex:1.0.3'
                }


  -> https://developers.facebook.com/apps
    -> we have to create a quickstart for android and ios app
    -> For Android:
        -> Package Name : com.example.env
        -> Default Activity Class Name : com.example.env.MainAcitivity

        -> now we have to generate a key
          -> if we are in a production we have to use the production key
          -> right now we can use the test key, to generate the test key
          -> for now i am using ubuntu wsl to generate key
          -> now follow instruction that is given:
              -> create file in android/app/src/main/res/values/strings.xml
              -> <?xml version="1.0" encoding="utf-8"?>
                    <resources> 
                        <string name="facebook_app_id">123</string>
                        <string name="fb_login_protocol_scheme">fb123</string>
                        <string name="facebook_client_token">56789</string>
                        <string name="app_name">FlutterTut</string>
                    </resources>
          -> now we will go to: AndroidManifest.xml
              ->  <uses-permission android:name="android.permission.INTERNET"/>
                  <meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
              <meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>

              <activity android:name="com.facebook.FacebookActivity"
                  android:configChanges=
                          "keyboard|keyboardHidden|screenLayout|screenSize|orientation"
                  android:label="@string/app_name" />
              <activity
                  android:name="com.facebook.CustomTabActivity"
                  android:exported="true">
                  <intent-filter>
                      <action android:name="android.intent.action.VIEW" />
                      <category android:name="android.intent.category.DEFAULT" />
                      <category android:name="android.intent.category.BROWSABLE" />
                      <data android:scheme="@string/fb_login_protocol_scheme" />
                  </intent-filter>
              </activity>
      -> For IOS:
        -> Bundle ID : com.roman.env

        -> follow Documentation and add in info.plist:
            -> <key>CFBundleURLTypes</key>
                <array>
                  <dict>
                  <key>CFBundleURLSchemes</key>
                  <array>
                    <string>fbAPP-ID</string>
                  </array>
                  </dict>
                </array>
                <key>FacebookAppID</key>
                <string>APP-ID</string>
                <key>FacebookClientToken</key>
                <string>CLIENT-TOKEN</string>
                <key>FacebookDisplayName</key>
                <string>APP-NAME</string>
            
*/

import 'package:flutter/material.dart';
import "package:flutter_facebook_auth/flutter_facebook_auth.dart";

class FacebookLogin extends StatelessWidget {
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
  bool _isLoggedIn = false;
  Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FacebookLogin'),
      ),
      body: _isLoggedIn
          ? Column(
              children: [
                Image.network(_userObj["picture"]["data"]["url"]),
                Text(_userObj["name"]),
                Text(_userObj["email"]),
                TextButton(
                  child: Text("LogOut"),
                  onPressed: () {
                    FacebookAuth.instance.logOut().then((value) {
                      setState(() {
                        _isLoggedIn = false;
                        _userObj = {};
                      });
                    });
                  },
                )
              ],
            )
          : Center(
              child: ElevatedButton(
                child: Text("login With Facebook"),
                onPressed: () async {
                  FacebookAuth.instance.login(
                      permissions: ["public_profile", "email"]).then((value) {
                    FacebookAuth.instance.getUserData().then((userData) {
                      setState(() {
                        _isLoggedIn = true;
                        _userObj = userData;
                      });
                    });
                  });
                },
              ),
            ),
    );
  }
}
