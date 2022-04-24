import 'package:flutter/material.dart';

class AnimateAlignClass extends StatefulWidget {
  @override
  State<AnimateAlignClass> createState() => _AnimateAlignClassState();
}

class _AnimateAlignClassState extends State<AnimateAlignClass> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimateAlign Class"),
        ),
        body: GestureDetector(
          // GestureDetector will detect the Gesture performed by the user
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: Container(
              width: 250,
              height: 250,
              color: Colors.red,
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                // How to align the child
                duration: const Duration(seconds: 1),
                // The duration over which to animate the parameters of this container.
                curve: Curves.fastOutSlowIn,
                // The curve to apply when animating the parameters of this container.
                child: const FlutterLogo(
                  size: 50.0,
                ),
                heightFactor: 5,
                // If non-null, sets its height to the child's height multiplied by this factor.
                widthFactor: 5,
                // If non-null, sets its width to the child's width multiplied by this factor.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
