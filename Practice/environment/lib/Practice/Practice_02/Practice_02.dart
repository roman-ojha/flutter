// import 'package:flutter/material.dart';

// class Practice02 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Hello"),
//         ),
//         body: Text(
//           "This is the body",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.w600,
//             fontStyle: FontStyle.italic,
//             height: 2,
//             decoration: TextDecoration.underline,
//             decorationColor: Colors.blue,
//             // color: Colors.red,
//             decorationStyle: TextDecorationStyle.solid,
//             // backgroundColor: Color.fromARGB(255, 200, 100, 100),
//             foreground: Paint()
//               ..style = PaintingStyle.stroke
//               ..strokeWidth = 2
//               ..color = Colors.blue,
//           ),
//           textDirection: TextDirection.ltr,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Practice02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello",
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Container(),
      ),
    ));
  }
}
