// https://pub.dev/packages/flutter_dotenv
// flutter pub add flutter_dotenv
// flutter pub add flutter_config
/*
  -> Create a .env file in the root of your project with the example content:
  -> Add the .env file to your assets bundle in pubspec.yaml. Ensure that the path corresponds to the location of the .env file!
      -> assets:
        - .env
  -> Remember to add the .env file as an entry in your .gitignore if it isn't already unless you want it included in your version control.
      -> *.env
  -> Load the .env file in main.dart
      -> Future<void> main() async {
            await dotenv.load(fileName: ".env");
            runApp(MyApp());
          }


  -> now let's create a file:
      -> .env.production
      -> .env.development
      -> .env.example

  -> write in pubspec.yaml:
      -> - .env.production
         - .env.development

  -> and in main.dart:
      -> Future<void> main() async {
          if (kReleaseMode) {
            // when we are in a production or in a release mode then we have to load this
            await dotenv.load(fileName: ".env.production");
          }
          if (kDebugMode) {
            // when we are in a development mode
            await dotenv.load(fileName: ".env.development");
          }
          runApp(MyApp());
        }

    -> now we will create a models folder inside we will make environment.dart and create a class:
        -> class Environment {
              static String get fileName {
                if (kReleaseMode) {
                  // when we are in a production or in a release mode then we have to load this
                  return ".env.production";
                }
                return ".env.development";
              }

              static String get apiUrl {
                return dotenv.env['API_URL'] ?? "API_URL not found";
              }
            }

    -> now in main.dart we can do:
        -> Future<void> main() async {
              await dotenv.load(fileName: Environment.fileName);
              runApp(MyApp());
            }

    -> now go the .gitignore and add:
        ->.env.production
          .env.development
*/

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:env/Class_00_Other_Topics/03_Env/models/environment.dart';

class FlutterEnv extends StatelessWidget {
  // now like this we can be able to access the environment variable value
  final apiUrl = dotenv.env['API_URL'];
  // another way
  final apiUrlA = dotenv.get("API_URL");

  // now after making models/environment.dart another way:
  final apiUrlB = Environment.apiUrl;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Env"),
        ),
        body: Column(
          children: [
            Container(
              child: Text(apiUrl ?? ""),
            ),
            Container(
              child: Text(apiUrlA),
            ),
            Container(
              child: Text(apiUrlB),
            ),
          ],
        ),
      ),
    );
  }
}
