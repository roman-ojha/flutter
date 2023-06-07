/*
  -> flutter pub add file_picker
  -> flutter pub add open_file

  -> on ios, or on desktop we have to add some cofig so for that :
  -> https://github.com/miguelpruivo/flutter_file_picker
*/
import 'dart:io';
import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";
import "package:open_file/open_file.dart";
import 'package:path_provider/path_provider.dart';
import "file_page.dart";

class FilePickerClass extends StatefulWidget {
  const FilePickerClass({Key? key}) : super(key: key);

  @override
  _FilePickerClassState createState() => _FilePickerClassState();
}

class _FilePickerClassState extends State<FilePickerClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
      ),
      body: Container(
        constraints: BoxConstraints(maxHeight: double.infinity),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Text(
                  "Pick Single File",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              onPressed: () async {
                // to pick single file ===========================================
                final result = await FilePicker.platform.pickFiles();
                print(result);
                if (result == null) return;
                // if we didn't pick a file

                // open single file
                final file = result.files.first;
                // here we will get the file
                openFile(file);
              },
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Text(
                  "Pick Multiple File",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              onPressed: () async {
                // to pick Multiple file =====================
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  // type: FileType.video,
                  // if we are using 'FileType' this we have to do extra step:
                  // go to ios/Runner/info.plist and past this:
                  // <key>NSPhotoLibraryUsageDescription</key>
                  // <string>Explain why your app uses photo library</string>
                  allowedExtensions: ["pdf", "png", "jpg", "mp3", "mp4"],
                  // only allow some kind of extention document
                );
                print(result);
                if (result == null) return;
                // if we didn't pick a file

                openFiles(result.files);
              },
            ),
          ],
        ),
      ),
    );
  }

  void openFile(PlatformFile file) async {
    OpenFile.open(file.path!);
    // this will open the file
    // if the file is image then it will open the image with the native app
    // if the file is pdf then it will open the pdf with the native app
    // or any mp3, mp4
    print("Name: ${file.name}");
    print("Bytes :${file.bytes}");
    // in flutter web we will get some bytes in return
    print("Size: ${file.size}");
    print("Extention: ${file.extension}");
    print("Path: ${file.path}");

    // NOTE: this file will be on the cache folder, when we will restart the app this file will be remove automatically
    // /data/user/0/com.example.env/cache/file_picker/<file_name>

    // if we want to save the file Permanently then
    final newFile = await saveFilePermanently(file);
    print("From Path: ${file.path!}");
    print("To Path: ${newFile.path}");
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    // here we will get the application directory
    final newFile = File("${appStorage.path}/${file.name}");
    // here we want to store the file

    return File(file.path!).copy(newFile.path);
    // now finally we want to copy our cache file to a new file
  }

  void openFiles(List<PlatformFile> files) async {
    // here we will get the list of files
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FilesPage(
          files: files,
          onOpenedFile: openFile,
        ),
      ),
    );
  }
}
