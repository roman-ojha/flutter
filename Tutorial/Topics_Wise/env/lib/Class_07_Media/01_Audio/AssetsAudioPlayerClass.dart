import 'package:flutter/material.dart';

// firstly got to the https://pub.dev/
// after that search for the assets_audio_player
// and after that go to the installing tab and then
// according to the doccument follow that and you are good to go

class AssetsAudioPlayerClass extends StatelessWidget {
  // AssetsAudioPlayer
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("music Player"),
        ),
        body: Container(),
      ),
    );
  }
}
