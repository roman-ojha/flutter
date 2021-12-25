import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/preferred_size.dart';

class TabBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to use TabBar first create DevaultTabController
      home: DefaultTabController(
        length: 4,
        // length is the number of tabBar
        initialIndex: 1,
        // that tab bar will be active whose initialIndex is given
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar"),
            bottom: TabBar(
              // this will create the Tabbar
              // but to control the Body of the App you also have to use TabBarView in the body
              automaticIndicatorColorAdjustment: true,
              // Whether this tab bar should automatically adjust the indicatorColor.
              controller: null,
              // This widget's selection and animation state.
              dragStartBehavior: DragStartBehavior.start,
              // Determines the way that drag start behavior is handled.
              enableFeedback: null,
              //Whether detected gestures should provide acoustic and/or haptic feedback.
              // indicator:
              indicatorPadding: EdgeInsets.all(10),
              // Padding for indicator. This property will now no longer be ignored even if indicator is declared or provided by TabBarTheme
              indicatorColor: Colors.orange,
              // The color of the line that appears below the selected tab
              // indicatorSize: TabBarIndicatorSize.label,
              indicatorSize: TabBarIndicatorSize.tab,
              // Defines how the selected tab indicator's size is computed.
              indicatorWeight: 10,
              // The thickness of the line that appears below the selected tab.
              // isScrollable: true,
              //Whether this tab bar can be scrolled horizontally
              labelColor: Colors.red,
              // The color of selected tab labels.
              unselectedLabelColor: Colors.white,
              // The color of unselected tab labels.
              unselectedLabelStyle: null,
              // The text style of the unselected tab labels.
              labelPadding: EdgeInsets.all(10),
              // The padding added to each of the tab labels
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              onTap: (value) {
                // this will return the value of index of tab that we just tab
                // print(value);
              },
              overlayColor: MaterialStateProperty.resolveWith((states) {
                // Defines the ink response focus, hover, and splash colors
                const Set<MaterialState> interactiveStates = <MaterialState>{
                  MaterialState.pressed,
                  MaterialState.hovered,
                  MaterialState.focused,
                };
                print(states);
                if (states.any(interactiveStates.contains)) {
                  return Colors.red;
                }
                return Colors.purple;
              }),

              tabs: [
                Tab(
                  child: Text("Tab1"),
                  // text: "Tab 1",
                ),
                Tab(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text("Tab2"),
                  ),
                  // text: "Tab 2",
                ),
                Tab(
                  // text: "Tab 3",
                  icon: Icon(
                    Icons.chat,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  text: "Tab 4",
                ),
              ],
            ),
          ),
          body: TabBarView(
            // Here TabBarViw children has to match the length of the DefaultTabController
            children: [
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.orange,
                alignment: Alignment.center,
                child: Text("Tab 01 Container",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text("Tab 02 Container",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.purple,
                alignment: Alignment.center,
                child: Text("Tab 03 Container",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.cyan,
                alignment: Alignment.center,
                child: Text("Tab 04 Container",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
