import 'package:flutter/material.dart';
import 'package:practice02/widgets/drawer.dart';
import "dart:math";

class SecondPage extends StatelessWidget {
  final String title;
  final Random random = Random();
  SecondPage({super.key, required this.title});

  Widget getContainer() {
    return Container(
      width: 100.0,
      // height: 100.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const AppDrawer(),
      body: Container(
        height: 200,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) => getContainer(),
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
