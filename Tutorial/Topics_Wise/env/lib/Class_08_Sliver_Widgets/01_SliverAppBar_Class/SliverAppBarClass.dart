import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SliverAppBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: CustomScrollView(
          // Sliver App bar is used with CustomscroolView to provide custom scroll bhevaiour
          slivers: <Widget>[
            SliverAppBar(
              actions: [
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
              // action is the same thing as the action in the AppBar widget
              actionsIconTheme: IconThemeData(
                color: Colors.yellow,
                size: 30,
                opacity: 0.8,
              ),
              // The color, opacity, and size to use for the icons that appear in the app bar's actions.
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
              leadingWidth: 100,
              // Defines the width of leading widget.
              automaticallyImplyLeading: false,
              // Controls whether we should try to imply the leading widget if nul
              backgroundColor: Colors.red,
              // color the background of the appbar
              backwardsCompatibility: true,
              // If true, preserves the original defaults for the backgroundColor, iconTheme, actionsIconTheme properties, and the original use of the textTheme and brightness properties
              title: Text("Silver App Bar"),
              // The primary widget displayed in the app bar
              titleSpacing: 40,
              // spacing around the title content on the horizontal axis This spacing is applied even if there is no leading content or actions. If you want title to take all the space available, set this value to 0.0
              titleTextStyle: TextStyle(color: Colors.blue),
              centerTitle: true,
              // wheter to center the title or not
              // collapsedHeight: 100,
              brightness: Brightness.dark,
              // This property is obsolete, please use systemOverlayStyle instead.
              systemOverlayStyle: SystemUiOverlayStyle(
                // Specifies the style to use for the system overlays that overlap the AppBar.
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarDividerColor: Colors.black,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
              // collapsedHeight: 100,
              // Defines the height of the app bar when it is collapsed.
              // elevation: 10,
              // The z-coordinate at which to place this app bar relative to its parent
              // excludeHeaderSemantics: false,
              // Whether the title should be wrapped with header Semantics.
              expandedHeight: 200.0,
              // The size of the app bar when it is fully expanded
              flexibleSpace: const FlexibleSpaceBar(
                //This widget is stacked behind the toolbar and the tab bar. Its height will be the same as the app bar's overall height.
                title: Text('Flaxible space'),
                centerTitle: true,
                // which will center the title
                titlePadding: EdgeInsets.all(20),
                // collapseMode: CollapseMode.pin,
                collapseMode: CollapseMode.parallax,
                // collapse mode for the different way to callapsed the flexible space
                background: FlutterLogo(),
              ),
              floating: true,
              // Whether the app bar should become visible as soon as the user scrolls towards the app bar
              forceElevated: true,
              // Whether to show the shadow appropriate for the elevation even if the content is not scrolled under the AppBar.
              foregroundColor: Colors.black,
              // The default color for Text and Icons within the app bar
              iconTheme: IconThemeData(color: Colors.blue),
              // The color, opacity, and size to use for toolbar icons.
              onStretchTrigger: null,
              // The callback function to be executed when a user over-scrolls to the offset specified by stretchTriggerOffset.
              pinned: false,
              // Whether the app bar should remain visible at the start of the scroll view.
              primary: false,
              // Whether this app bar is being displayed at the top of the screen
              shadowColor: Colors.blue,
              // color of the Shadow below the app bar
              shape: null, // -> ShapeBorder
              // The shape of the app bar's material's shape as well as its shadow.
              snap: true,
              // If snap and floating are true then the floating app bar will "snap" into view
              stretch: true,
              // Whether the app bar should stretch to fill the over-scroll area
              stretchTriggerOffset: 10,
              // The offset of overscroll required to activate onStretchTrigger.
              textTheme: TextTheme(),
              // The typographic styles to use for text in the app bar. Typically this is set along with brightness backgroundColor, iconTheme.
              toolbarHeight: 150,
              // Defines the height of the toolbar component of an AppBar.
              toolbarTextStyle: null, // -> textStyle
              bottom: PreferredSize(
                // This widget appears across the bottom of the app bar.
                child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                    child: Text(
                      "Bottom",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
                preferredSize: Size(10, 10),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  color: (index % 2 == 0) ? Colors.orange : Colors.blue,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              }),
            )
          ],
        )));
  }
}
