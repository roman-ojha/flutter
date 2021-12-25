import 'package:flutter/material.dart';

/*
  => the steps to add the splace screen in flutter is different for android and ios
      => For Android:
          -> to properly display our splash screen in and adroid app built with flutter we need two themes
              1) Lunch Theme
              2) Normal Theme
              -> fortunately the flutter team has already created those tow themes for us
              -> since december 2019 with the release of embeded version 2 when you create a new project the photo ships the sample apps with two themes already created
              -> the only things left to do are adding your image and background color
          -> First we will located the android folder in our porject ir key and in this folder we will navigate to this path:
                path: android/app/src/main/res/drawable
                -> in here we need to add the image that we want to show in the splash screen with the name  'launch_image'
                -> now open the file 'launch_background.xml'
                -> here we can Modify this file to customize your launch splash screen 
                -> the first thing we will modify here is the background color for the splash screen
                      -> <item android:drawable="@android:color/black" />
                -> if it didnot work then in path: android/app/src/main/res/drawable-v21/launch_background.xml
                      -> <item android:drawable="@android:color/black" />
          -> now lets add the image over the background:
                -> again in the same file add:
                      <item>
                          <bitmap
                              android:gravity="center"
                              android:src="@drawable/launch_image" />
                      </item>
          -> to add a custom color since we are doing this in the android native environment it is good practice to define a colors.xml file in the values folder 
          -> now we can past this pices of code in colors.xml
                -> <?xml version="1.0" encoding="utf-8"?>
                    <resources>
                        <color name="background_color">#FFCC00</color>
                    </resources>
          -> now we can use the 'background_color' 'name="background_color"' in the launch_background.xml:
                -> <item android:drawable="@color/background_color" />
          -> another thing that is important to mention is that you don't always want to put your launch image in this drawable folder, since your app will be used on different devices sizes it is preferable to put the different resolutions of your launch image in those mipmap folders and then let android decide the appropriate launch image to show depending on the devices screen sizes
          -> in that case make sure that the image resource in the 'launch_background.xml' is set like this
                  -> <item>
                          <bitmap
                              android:gravity="center"
                              android:src="@mipmap/launch_image" />
                      </item>
      => For IOS:
          to continue the tutorial for IOS you can watch: https://www.youtube.com/watch?v=JVpFNfnuOZM
      => Best Practices
          1) avoid texts
          2) avoid Static Image
          3) Don't advortise
          4) Nearly identical to the first screen
*/
class FlutterLuncherIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
