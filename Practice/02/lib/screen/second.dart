import 'package:flutter/material.dart';
import 'package:practice02/widgets/drawer.dart';
import "dart:math";

class SecondPage extends StatelessWidget {
  final String title;
  final Random random = Random();
  SecondPage({super.key, required this.title});

  Widget getContainer(int verticalIndex, int horizontalIndex) {
    return Container(
      width: 100.0,
      // height: 100.0,
      margin: const EdgeInsets.only(top: 30.0, left: 20.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Center(child: Text("Item [$verticalIndex] [$horizontalIndex]")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: 50,
        controller: PrimaryScrollController.of(context),
        itemBuilder: (BuildContext context, int verticalIndex) {
          ScrollController scrollController = ScrollController();
          return SizedBox(
            height: 200, // Set the desired height for each vertical item
            child: Scrollbar(
              thumbVisibility: true,
              controller: scrollController,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 50,
                controller: scrollController,
                itemBuilder: (BuildContext context, int horizontalIndex) =>
                    getContainer(verticalIndex, horizontalIndex),
              ),
            ),
          );
        },
      ),
    );
  }
}
