import 'package:flutter/material.dart';

class OpacityClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _currentOpacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpacityClass'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Opacity ============================================
            Opacity(
              opacity: 0.5,
              child: Container(
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(
                  "Opacity",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              // we can also use opacity for blending one child of a stace onto another
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  color: Colors.red,
                  child: Text(
                    "Opacity",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                // AnimatedOpacity==============================================
                AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  // duration of the opacity changes
                  opacity: _currentOpacity,
                  // we have to change the opacity value using some function and 'AnimatedOpacity' automatically decated the value and animated according to that
                  curve: Curves.linear,
                  // trasition style
                  onEnd: () {
                    // when animation complete this function will get invoked
                    print("Hello");
                  },
                  alwaysIncludeSemantics: true,
                  // Whether the semantic information of the children is always included
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentOpacity = 0.5;
                        // here we are changing the value of opacity
                      });
                    },
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        "Opacity",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
