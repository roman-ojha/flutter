import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_manager/file_manager.dart';
import 'package:file_finder/file_finder.dart';
import 'package:open_file/open_file.dart';

class Test extends StatelessWidget {
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
  testFunc() async {
    var fileFinder = FileFinder();
    var _files = fileFinder.findAll("mp3", sort: false);
    print(_files[0]);
    OpenFile.open(_files[0].path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Press"),
          onPressed: testFunc,
        ),
      ),
    );
  }
}
