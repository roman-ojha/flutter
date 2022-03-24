import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

/*
  -> flutter pub add image_picker

  For IOS:
    -> we need to perform extra step
    -> go to ios/runner/info.plist and past these thing
    -> <key>NSPhotoLibraryUsageDescription</key>
      <string>To take user profile image</string>
      <key>NSCameraUsageDescription</key>
      <string>need a permission to access camera</string>
      <key>NSMicrophoneUsageDescription</key>
      <string>Used to capture audio for image picker plugin</string>
*/

class ImagePickerPackage extends StatelessWidget {
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
  File? image;
  // storing image inside the image variable

  Future pickImage(ImageSource source) async {
    try {
      // picking image form gallery or camera
      print("Hello");
      final image = await ImagePicker().pickImage(source: source);
      // final video = await ImagePicker().pickVideo(source: source);
      // to pick video from the gallery or camera
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePickerPackage'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 160,
                      height: 160,
                    )
                  : FlutterLogo(
                      size: 120.0,
                    ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Image Picker",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.browse_gallery,
                  size: 15.0,
                ),
                label: Text("Pick Gallery"),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera_alt_rounded,
                  size: 15.0,
                ),
                label: Text("Pick Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
