import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/*
Temporary directory
A temporary directory (cache) that the system can clear at any time. On iOS, this corresponds to the NSCachesDirectory. On Android, this is the value that getCacheDir() returns.


Documents directory
A directory for the app to store files that only it can access. The system clears the directory only when the app is deleted. On i
*/
class ReadAndWriteFile extends StatefulWidget {
  const ReadAndWriteFile({Key? key}) : super(key: key);

  @override
  _ReadAndWriteFileState createState() => _ReadAndWriteFileState();
}

class _ReadAndWriteFileState extends State<ReadAndWriteFile> {
  int _counter = 0;

  Future<String> get _localPath async {
    // here we are returning the application directory
    final directory = await getApplicationDocumentsDirectory();
    // '/data/user/0/com.example.<app_name>'
    // From your path:/data/user/0/com.companyname.notes/files/.local/share/Notes.txt, we can know that you want to access internal storage, but Internal storage refers to the non-volatile memory that Android allocates to the operating system, APKs, and for individual apps. This space is not accessible except by the operating system or apps. So you can not find this text file from internal storage.

    final externalDirectory = await getExternalStorageDirectory();
    // /storage/emulated/0/Android/data/com.example.<app_name>/files

    // Application temporary directory: /data/user/0/{package_name}/cache
    final tempDirectory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    // Once you know where to store the file, create a reference to the file’s full location. You can use the File class from the dart:io library to achieve this.
    final path = await _localPath;
    return File("$path/counter.txt");
  }

  Future<File> writeCounter(int counter) async {
    // Now that you have a File to work with, use it to read and write data. First, write some data to the file. The counter is an integer, but is written to the file as a string using the '$counter' syntax.
    final file = await _localFile;

    // Write the file
    return file.writeAsString("$counter");
  }

  Future<int> readCounter() async {
    // Now that you have some data on disk, you can read it. Once again, use the File class.
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    readCounter().then((int value) {
      // reading file value and assigning to the '_counter'
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // now write the counter value to the file
    return writeCounter(_counter);
  }

  Future<File> _decrementCounter() {
    setState(() {
      _counter--;
    });

    return writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read and Write File"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "$_counter",
              style: TextStyle(fontSize: 30.0),
            ),
            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text("Increment"),
            ),
            ElevatedButton(
              onPressed: () {
                _decrementCounter();
              },
              child: Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
