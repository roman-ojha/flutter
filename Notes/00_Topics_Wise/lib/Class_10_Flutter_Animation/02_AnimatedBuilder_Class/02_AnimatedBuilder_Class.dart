import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Flutter code sample for AnimatedBuilder

// built with an [AnimatedBuilder] and makes use of the [child] feature to
// avoid having to rebuild the [Container] each time.

class AnimatedBuilderClass extends StatefulWidget {
  State<AnimatedBuilderClass> createState() => _AnimatedBuilderClassState();
}

// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _AnimatedBuilderClassState extends State<AnimatedBuilderClass>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AnimatedBuilder Class"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: AnimatedBuilder(
            // AnimatedBuilder-----------
            animation: _controller,
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.orange,
              child: Center(
                child: Text("Hello"),
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 9.0 + math.pi,
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
