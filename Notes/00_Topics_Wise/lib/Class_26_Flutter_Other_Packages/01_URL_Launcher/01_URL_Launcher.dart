import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/*
  => flutter pub add url_launcher
  -> https://pub.dev/packages/url_launcher
*/

class FlutterURLLauncher extends StatelessWidget {
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
  String phoneNumber = "";
  String _launchUrl = "https://notion.so";

  Future<void> _launchInBrowser(String url) async {
    // launching the url in the browser
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{"header_key": "header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  Future<void> _launchInApp(String url) async {
    // launching the url in the browser
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{"header_key": "header_value"},
      );
    } else {
      throw "Could not launch $url";
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Cound not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterURLLauncher'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Launch in Browser"),
              onPressed: () {
                _launchInBrowser(_launchUrl);
              },
            ),
            ElevatedButton(
              child: const Text("Launch in App"),
              onPressed: () {
                _launchInApp(_launchUrl);
                Timer(const Duration(seconds: 5), () {
                  // after 5 second we are closing the webview
                  closeWebView();
                });
              },
            ),
            ElevatedButton(
              child: const Text("Make a call"),
              onPressed: () {
                _makePhoneCall("tel:9816949047");
              },
            ),
          ],
        ),
      ),
    );
  }
}
