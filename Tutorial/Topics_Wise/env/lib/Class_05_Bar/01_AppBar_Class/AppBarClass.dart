import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
              AppBar
   ______________________________
  |  ________        ________   |
  | |leading| title | action |  |
  | |_______|       |________|  |
  |       flexibleSpace         |
  |_____________________________|    
  |           bottom            |
  |_____________________________|
*/

class AppBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          backgroundColor: Color(0xffeb4034),
          elevation: 40,
          // elevation to shadow the buttom part of AppBar
          leadingWidth: 100,
          centerTitle: true,
          // for Whether the title should be centered or not
          excludeHeaderSemantics: true,
          // Whether the title should be wrapped with header Semantics.
          foregroundColor: Colors.black,
          // The default color for Text and Icons within the app bar
          iconTheme: IconThemeData(color: Colors.black, size: 50, opacity: 0.9),
          // The color, opacity, and size to use for toolbar icons
          primary: false,
          // Whether this app bar is being displayed at the top of the screen.
          shadowColor: Colors.blue,
          // The of the shadow below the app bar.
          shape: ShapeBorder.lerp(
              //The shape of the app bar's material's shape as well as its shadow.
              Border(
                bottom: BorderSide(
                    color: Colors.red, width: 10, style: BorderStyle.solid),
              ),
              Border(bottom: BorderSide(color: Colors.green, width: 10)),
              10),
          bottomOpacity: 0.5,
          // this widget will change the opacity of the Bottom Widgets
          brightness: Brightness.dark,
          // This property is obsolete, please use systemOverlayStyle instead
          systemOverlayStyle: SystemUiOverlayStyle(
            // Specifies the style to use for the system overlays that overlap the AppBar.
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          textTheme: TextTheme(
            // The typographic styles to use for text in the app bar. Typically this is set along with brightness backgroundColor, iconTheme.
            bodyText1: TextStyle(color: Colors.red, fontSize: 100),
          ),
          // The default text style for the AppBar's title widget.
          leading: Row(
            // leading will take widget and align them at the left side of the AppBar
            children: [
              Icon(
                Icons.home,
                color: Colors.white,
                // size: 40,
              ),
              Icon(
                Icons.chat,
                color: Colors.white,
                // size: 40,
              )
            ],
          ),
          title: Text("Title 01 space space space "),
          titleSpacing: 10,
          // The spacing around title content on the horizontal axis. This spacing is applied even if there is no leading content or actions. If you want title to take all the space available, set this value to 0.0
          titleTextStyle: TextStyle(fontSize: 30, color: Colors.black),
          // The default text style for the AppBar's title widget
          toolbarOpacity: 0.7,
          // to control the opacity of the tollbar
          toolbarTextStyle: TextStyle(fontSize: 30, color: Colors.black),
          // The default text style for the AppBar's leading, and actions widgets, but not its title.
          actions: [
            // actions take widget and align all the widget from the right side
            Icon(
              Icons.phone,
            ),
            IconButton(
              icon: Icon(
                Icons.menu,
                size: 40,
              ),
              onPressed: () => {},
            )
          ],
          actionsIconTheme: IconThemeData(color: Colors.white, size: 40),
          // this actionsIconTheme is The color, opacity, and size to use for the icons that appear in the app bar's
          automaticallyImplyLeading: true,
          // Controls whether we should try to imply the leading widget if null
          backwardsCompatibility: true,
          // If true, preserves the original defaults for the backgroundColor, iconTheme, actionsIconTheme properties, and the original use of the textTheme and brightness properties.
          flexibleSpace: Container(
              //This widget is stacked behind the toolbar and the tab bar. Its height will be the same as the app bar's overall heigh
              alignment: Alignment.center,
              decoration: BoxDecoration(),
              child: Text(
                "FlexibleSpace",
                style: TextStyle(fontSize: 30, color: Colors.black),
              )),
          bottom: PreferredSize(
            // This widget appears across the bottom of the app bar.
            child: Container(
                width: double.infinity,
                height: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Text(
                  "Bottom",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            preferredSize: Size(10, 10),
          ),
        ),
      ),
    );
  }
}
