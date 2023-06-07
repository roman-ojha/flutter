import 'package:flutter/material.dart';

class BottomNavigationBarClass extends StatefulWidget {
  State<BottomNavigationBarClass> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarClass> {
  int _currentIndex = 0;
  void _changeCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget NavigationBody() {
    if (_currentIndex == 0) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Text("Activity",
            style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    } else if (_currentIndex == 1) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink,
        ),
        child:
            Text("Chat", style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    } else if (_currentIndex == 2) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
        child:
            Text("Teams", style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    } else if (_currentIndex == 3) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.teal,
        ),
        child: Text("Assignment",
            style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    } else if (_currentIndex == 4) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.indigo,
        ),
        child: Text("Calendar",
            style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    } else if (_currentIndex == 5) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lime,
        ),
        child:
            Text("More", style: TextStyle(fontSize: 50, color: Colors.white)),
      );
    }
    return Text("Hello");
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // to use TabBar first create DevaultTabController
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar Class"),
        ),
        body: NavigationBody(),
        // so BottomNavigationBar Widget in on the Scaffold Widget
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _changeCurrentIndex,
          // then user tap the Items of the navigation bar it will call
          currentIndex: _currentIndex,
          // determine the Current index of of item to select
          elevation: 10,
          enableFeedback: true,
          // Whether detected gestures should provide acoustic and/or haptic feedback.

          iconSize: 30,
          // set the Icon size of the NavigationBar Items
          mouseCursor: null,
          //he cursor for a mouse pointer when it enters or is hovering over the tiles
          selectedFontSize: 18,
          // set the fontSize of the Seelcted Items in NavigationBar
          selectedItemColor: Colors.purple,
          // fixedColor: Colors.red,
          // set the color of selected NavigationBar Items
          selectedLabelStyle: TextStyle(color: Colors.red, fontSize: 20),
          // The TextStyle of the BottomNavigationBarItem labels when they are selected.
          selectedIconTheme: IconThemeData(color: Colors.red),
          // The size, opacity, and color of the icon in the currently selected BottomNavigationBarItem.icon
          showSelectedLabels: true,
          // Whether the labels are shown for the selected BottomNavigationBarItem.
          showUnselectedLabels: true,
          // Whether the labels are shown for the unselected BottomNavigationBarItems.
          unselectedFontSize: 15,
          unselectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedIconTheme: IconThemeData(color: Colors.blue),
          unselectedItemColor: Colors.blue,
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: "Teams",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Assignment",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_month),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}
