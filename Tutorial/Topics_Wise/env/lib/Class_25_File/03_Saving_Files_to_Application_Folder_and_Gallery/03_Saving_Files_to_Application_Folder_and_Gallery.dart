/*
    -> flutter pub add dio
        -> to download file from url
    -> flutter pub add path_provider
        -> to get the information about the device spacific storage directory
    -> flutter pub add image_gallery_saver
        -> to save file to the folders app on an ios devices
    -> flutter pub add permission_handler
        -> to check for permission before doing task
    
    -> on Android:
        -> now go to android/app/src/main/AndroidManifest.xml add this:
          ->  <uses-permission android:name="android.permission.INTERNET"/>    
              <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
          -> for the internet and external storage permission

              -> android:requestLegacyExternalStorage="true"
          -> this permission only required if you tirget sdk version of 29 or above
          -> to check that we have to go to android/app/build.gradle
                -> compileSdkVersion 30
                -> targetSdkVersion 30
              -> here they are above so we have to add 
              -> for this appplication i have to make this otherwise it is throwing an error:
                -> compileSdkVersion 31

    -> on IOS:
        -> now go to ios/Runner/info.plist and add this:
            -> <key>NSPhotoLibraryUsageDescription</key>
                <string>This app needs to use Photos</string>
              
            -> here we need to get the permission and describe why we need to use this permission

*/

/*
  => here we will see store downloaded file on application spacific folder like on the root internal storage folder
*/

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import "package:dio/dio.dart";
import "package:image_gallery_saver/image_gallery_saver.dart";

class SavingFilesToApplicationFolderAndGallery extends StatelessWidget {
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
  bool loading = false;
  final Dio dio = Dio();
  double progress = 0;

  Future<bool> saveFile(String url, String fileName) async {
    // filename for the file to be saved
    Directory directory;
    // we will going to use dart:io package
    // now the value of directory will be different for android and ios and the code we are write here have a potential to throw an exception
    try {
      // we need to check the platform is android or ios
      if (Platform.isAndroid) {
        // for android
        if (await _requestpermission(Permission.storage)) {
          // here we are requesting for the storage permission
          // if storage permission granted
          directory = await getExternalStorageDirectory() as Directory;
          // /storage/emulated/0/Android/data/com.example.env/files

          // we are trying to get the path: /storage/emulated/0/ so that we can store the file in there
          String newPath = "";
          // this will represent the path for our own application folder
          List<String> folders = directory.path.split("/");
          for (int x = 1; x < folders.length; x++) {
            // we are starting the value from 1 because first 0 will be empty because there is nothing to the first '/'
            String folder = folders[x];
            if (folder != "Android") {
              newPath += "/" + folder;
              // here we are create a folder path : /storage/emulated/0/
            } else {
              break;
            }
          }
          newPath = newPath + "/FlutterTutorialApp";
          // here we are create a path to store : /storage/emulated/0/FlutterTutorialApp
          directory = Directory(newPath);
          // now here we are creting the new directory path
          print(directory.path);
        } else {
          // if storage permission is not granted
          return false;
        }
      } else {
        // for ios:
        if (await _requestpermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
          // this wil going to give us the temporary directory of ios app
        } else {
          return false;
        }
      }
      // how to save the file we need to check if the directory exist or not
      if (!await directory.exists()) {
        // if directory is not created then we will create a directory
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        // if directory exist then we will create a new file in that directory
        File savedFile = File(directory.path + "/$fileName");
        // now we have to complete path to save a file
        // now we have to download the file and save it into 'savedFile' path
        await dio.download(url, savedFile.path,
            onReceiveProgress: (downloaded, totalSize) {
          // onReceiveProgress function will show us how much pregress happen on download the file
          // it wil give us the size of the downloaded content and the totalSize of the file
          setState(() {
            progress = downloaded / totalSize;
          });
        });
        if (Platform.isIOS) {
          // here incase of ios we are setting the file directory to the temporaryDirectory because after download completed and save in temporary directory we will move this to the photo library
          await ImageGallerySaver.saveFile(savedFile.path,
              isReturnPathOfIOS: true);
          // now here we are saving the file in the imagegallery

        }
        return true;
        // after completing all the downloaded process
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> _requestpermission(Permission permission) async {
    // this will request the required permission
    // 'premissions' = instance of 'Permissions'

    if (await permission.isGranted) {
      // if permission had granted then we will return true
      return true;
    } else {
      // if not we will request for the permission
      var result = await permission.request();
      //  result return PermissionStates
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  downloadFile() async {
    setState(() {
      loading = true;
    });

    // here we have to download the file and save into the storage
    String fileUrl =
        "https://firebasestorage.googleapis.com/v0/b/mvstreamer.appspot.com/o/Video%2F041a57192a4b6624e7f63be26a11a942.mp4?alt=media&token=1278297e-41f7-49d1-8b09-b2eada1ed2db";
    bool downloaded = await saveFile(fileUrl, "videoName.mp4");
    if (downloaded) {
      debugPrint("file Downloaded");
    } else {
      debugPrint("Problem Downloading File");
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SavingFilesToApplicationFolderAndGallery'),
      ),
      body: Center(
        child: loading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  // progress bar until file no downloaded
                  value: progress,
                  minHeight: 10,
                ),
              )
            : TextButton.icon(
                icon: Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                label: Text("Download Video",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
                onPressed: downloadFile,
              ),
      ),
    );
  }
}
