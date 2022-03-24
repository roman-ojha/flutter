import 'package:flutter/material.dart';
import 'dart:io';

class ImageClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    File? image;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Class"),
        ),
        body: ListView(
          children: [
            Image.file(image!),
            //  to show the file image
            Image(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
            ),
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : LinearProgressIndicator();
              },
              // loadingBuilder will build the loading ui while downloading the Image
            ),
            Image(
              // here to use AssetImage you have to include the assets image in the pubspac.yaml
              // and also you have to create a directory for the assets
              // <project>/assets/images/<image_Name>
              /*
                assets:
                  - assets/images/img1.jpg
                  - assets/images/img2.jfif
                  - assets/images/img3.jpg
                But we can also be able to do this
                assets:
                  -assets/
              */
              image: AssetImage('assets/images/img1.jpg'),
            ),
            Image.asset(
              'assets/images/google_icon.jpg',
              // fit: BoxFit.fill,
              // fit: BoxFit.contain,
              // fit: BoxFit.cover,
              color: Colors.blue,
              // color will color the image
              // colorBlendMode: BlendMode.darken,
              // colorBlendMode: BlendMode.multiply,
              // colorBlendMode: BlendMode.plus,
              // colorBlendMode: BlendMode.saturation,
              colorBlendMode: BlendMode.saturation,
              // to Blend the color with the image
              semanticLabel: "Dash mascot",
              height: 500,
              // width: 200,
              repeat: ImageRepeat.repeat,
            ),
          ],
        ),
      ),
    );
  }
}
