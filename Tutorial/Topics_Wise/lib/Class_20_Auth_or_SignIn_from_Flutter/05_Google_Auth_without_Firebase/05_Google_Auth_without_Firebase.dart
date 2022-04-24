/*
  -> https://console.cloud.google.com
    -> create a project Fluttertutauthwithoutfirebase
      -> OAuth conslent screen
          -> External

  -> https://docs.flutter.dev/deployment/android#create-an-upload-keystore
      -> first generate the key so, we will go the java jdk bin folder in terminal and then past this in there
          ->     keytool -genkey -v -keystore c:\Users\USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload


          -> after some edit:
            ->   .\keytool -genkey -v -keystore d:\googleSignInKey.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias androiddebugkey

              -> keystore password : process.env.GOOGLE_SIGNIN_KEYSTORE_PASSWORD

            -> after that we will get the file in given location "d:\googleSignInKey.jks"
            -> now copy the given file in android/app
            -> .gitignore
          
          -> now go to android/app/build.gradle and write:
              -> signingConfigs{
                        debug{
                            keyAlias <alias_key>
                            keyPassword <password_that_we_had_set_before>
                            storeFile file("googleSignInKey.jks")
                            storePassword <password_that_we_had_set_before>
                        }
                    }
                    buildTypes {
                        debug {
                            signingConfig signingConfigs.debug
                        }
                    }
            
          -> now go the google cloud console under credentials and then create the credential
              -> OAuth client ID
              -> now copy the application id: com.example.env 
              -> package name : com.example.env
              -> for SHA-1 key:
                  -> go to <project>/android folder in terminal then execute:
                    -> ./gradlew signingReport
                  -> now we will go to content in terminal after execute:
                  -> variant: debug
                    -> and copy the SHA1 value:
                      -> 56:F6:3F:7E:55:15:54:03:28:F2:FE:67:73:80:C3:01:AB:C0:68:08
    
    -> For IOS:
    -> For Web:
*/

import 'package:flutter/material.dart';
import 'api/google_signin_api.dart';
import 'logged_in_page.dart';

class GoogleAuthWithoutFirebase extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoogleAuthWithoutFirebase'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign in with Google"),
          onPressed: _googleSignin,
        ),
      ),
    );
  }

  Future _googleSignin() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      // if use is null
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sign In Failed")));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoggedInPage(user: user),
      ));
    }
  }
}
