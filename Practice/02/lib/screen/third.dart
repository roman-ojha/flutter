import "package:flutter/material.dart";
import "package:practice02/widgets/drawer.dart";

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<StatefulWidget> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void openDrawer() {
    _key.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text("Third Page"),
          centerTitle: true,
          elevation: 10.1,
          leadingWidth: 100.0,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: openDrawer,
              ),
              Navigator.of(context).canPop()
                  ? IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  : const SizedBox(),
            ],
          ),
          bottom: const TabBar(tabs: [
            Tab(
              child: Icon(
                Icons.video_call,
                color: Colors.white,
              ),
            ),
            Tab(
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            Tab(
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
          ]),
        ),
        drawer: const AppDrawer(),
        body: const TabBarView(
          children: [
            TabBarPage(title: "Video Page"),
            TabBarPage(title: "Home Page"),
            TabBarPage(title: "Message Page"),
          ],
        ),
      ),
    );
  }
}

class TabBarPage extends StatelessWidget {
  final String title;
  const TabBarPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.0,
        height: 300.0,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
