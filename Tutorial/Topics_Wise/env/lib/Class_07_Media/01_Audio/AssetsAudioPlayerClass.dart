import 'package:flutter/material.dart';
import 'dart:io';
import "package:audioplayers/audioplayers.dart";

// firstly got to the https://pub.dev/
// after that search for the assets_audio_player or audioplayers
// https://pub.dev/packages/audioplayers
// and after that go to the installing tab and then
// according to the doccument follow that and you are good to go

// NOTE: if error came after adding 'audioplayers' package then upgrade the kotlin version

class AssetsAudioPlayerClass extends StatefulWidget {
  const AssetsAudioPlayerClass({Key? key}) : super(key: key);

  @override
  _AssetsAudioPlayerClassState createState() => _AssetsAudioPlayerClassState();
}

class _AssetsAudioPlayerClassState extends State<AssetsAudioPlayerClass> {
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache;
  String audioPath = "music/Music01.mp3";

  @override
  void initState() {
    super.initState();

    // if (kIsWeb) {
    //   return;
    // }
    if (Platform.isIOS) {
      audioCache.fixedPlayer?.notificationService.startHeadlessService();
    }

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((event) {});
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playAudio() async {
    await audioCache.play(audioPath);
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("music Player"),
        ),
        body: Container(
          child: IconButton(
            onPressed: () {
              playAudio();
            },
            icon: Icon(Icons.play_circle),
          ),
        ),
      ),
    );
  }
}
