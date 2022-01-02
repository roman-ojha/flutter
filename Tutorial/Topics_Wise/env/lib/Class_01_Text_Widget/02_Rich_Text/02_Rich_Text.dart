import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RichTextWidget extends StatefulWidget {
  const RichTextWidget({Key? key}) : super(key: key);

  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("RichText"),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: [
            buildHello1(),
            SizedBox(height: 10),
            buildHello2(),
            SizedBox(height: 10),
            buildEmailLink(),
            SizedBox(height: 10),
            buildPhoneNumber(),
            SizedBox(height: 10),
            buildWebsiteLink()
          ],
        ),
      ),
    );
  }

  Widget buildHello1() => RichText(
        // here we are creating the test "Hello World" but with differet color and different font size
        text: TextSpan(
          children: [
            TextSpan(
              // TextSpan by default have the white color
              text: "Hello",
              style: TextStyle(
                color: Colors.teal,
                fontSize: 28,
              ),
            ),
            TextSpan(
              text: 'World',
              style: TextStyle(
                color: Colors.red,
                fontSize: 40,
              ),
            )
          ],
        ),
      );

  Widget buildHello2() => Text.rich(
        TextSpan(
          text: "Hello",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 28,
          ),
          children: [
            // here all of the TextSpan will inherate all of the style attribute of the 'style' property of a parent widget but we can override that value
            TextSpan(
              text: "World",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '👋',
            ),
            TextSpan(
              text: "\u{1F44B}",
              // we can change the emoji into the unicode
            ),
          ],
        ),
      );

  Widget buildEmailLink() => RichText(
        text: TextSpan(
          text: "Contact me via: ",
          style: TextStyle(color: Colors.black, fontSize: 20),
          children: [
            WidgetSpan(
              // so we can use a "TextSpan" inside the RichText and we also can use a "WidgetSpan" if we want to use any widget within the rich text then we can also do that
              child: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              alignment: PlaceholderAlignment.middle,
            ),
            TextSpan(
              text: "Email",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = launchEmail,
              // here if we will tap the text 'Email' then it will recognize it and then we want to call the 'launchEmail' function which will make the email
            ),
          ],
        ),
      );

  Widget buildPhoneNumber() => RichText(
        text: TextSpan(
          text: "Call Me: ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "+12349876554321",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = launchPhoneNumber,
              // here after tapping phone number we want to call the function 'launchPhoneNumber'
            )
          ],
        ),
      );

  Widget buildWebsiteLink() => RichText(
        // here we will open the webste when uer click the text
        text: TextSpan(
          text: "Read My Blog",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: "HERE",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = launchWebste,
              // to launch the webiste on tap
            ),
          ],
        ),
      );

  Future launchEmail() async {
    final toEmail = "razzroman98@gmail.com";
    final subject = "Example Subject";
    final body = "Hello world";
    // here to send the email we need to install 'flutter pub add url_launcher'

    final email =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}$body=${Uri.encodeFull(body)}';
    // here this is like a code to send an email
    await launch(email);
  }

  Future launchPhoneNumber() async {
    const phoneNumber = "+12349876554321";
    await launch('tel:$phoneNumber');
    // here we again call the launch method and we have the formate inside it to call the phone number
  }

  Future launchWebste() async {
    const url = "https://flutter.dev";
    await launch(url);
  }
}
