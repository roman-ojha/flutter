import 'package:flutter/cupertino.dart';
// you need a cupertino package to do that
import 'package:flutter/material.dart';

class CupertinoSilverNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CupertinoSliverNavigationBar
    // An iOS-styled navigation bar with iOS-11-style large titles using slivers.
    // The CupertionoSilverNavigationBar must be placed in a silver group such as the CustomScrollView
    // This navigation bar consists of two sections, a pinned static section on top and a sliding section containing iOS-11-style large title below it.
    // It should be placed at top of the screen and automatically accounts for the iOS status bar.
    return CupertinoApp(
        title: "Flutter App",
        debugShowCheckedModeBanner: false,
        home: CupertinoPageScaffold(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text("Settings"),
                )
              ];
            },
            body: Center(
              child: Text("Home Page"),
            ),
          ),
        ));
  }
}
