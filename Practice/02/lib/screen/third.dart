import "package:flutter/material.dart";

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<StatefulWidget> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Third Page"),
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
