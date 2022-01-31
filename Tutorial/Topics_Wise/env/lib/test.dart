import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_manager/file_manager.dart';

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
    Directory directory = await getExternalStorageDirectory() as Directory;
    List files;
    List folders = directory.path.split("/");
    // print(folders);
    String requiredPath = "";
    for (var i = 1; i < folders.length; i++) {
      if (folders[i] != "Android") {
        requiredPath += "/" + folders[i];
      } else {
        break;
      }
    }
    directory = Directory(requiredPath);
    // print(requiredPath);
    // List allRootDirectory =
    //     directory.listSync().map((item) => item.path).toList(growable: false);
    // for (int i = 0; i < allRootDirectory.length; i++) {
    //   List insideDirectory = [];
    //   Directory currentDirectory = Directory(allRootDirectory[i]);
    //   if (currentDirectory.path != "${directory.path}/Android") {
    //     var just = currentDirectory
    //         .listSync()
    //         .map((item) => item.path)
    //         .where((item) => item.endsWith(".mp4"))
    //         .toList(growable: false);
    //     print(just);
    //   }
    // }
    // print(allRootDirectory);
    files = Directory(requiredPath).listSync();
    print(files);
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
