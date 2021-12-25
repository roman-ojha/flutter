import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/*
  -> The Text widget displays a string of text with single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints.
*/

/*
  => Text Constructor(Widget):
    const Text(
    String data,
    {Key? key,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior}
)
*/

class TextWidget extends StatelessWidget {
  final value = [10, 20, 30];
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text Widget"),
        ),
        body: Column(
          children: [
            Text("Hello"), // to print the text in App
            /*-----------------------TextAlign----------------------*/
            Container(
              width: double.infinity,
              child: Text(
                "Hello",
                textAlign: TextAlign
                    .center, // to make the text center if block width is full
                //textAlign: TextAlign .end, // to Put the Text at the end if block width is full
                //textAlign: TextAlign.right, // to Put the Text at the right if block width is full
                // textAlign: TextAlign.start, // to Put the Text at the Start if block width is full
                //textAlign: TextAlign.left, // to Put the Text at the left if block width is full
                // textAlign: TextAlign.values.last,
                // textAlign: TextAlign.values.first,
              ),
            ),
            /*------------------TextStye---------------------*/
            Container(
              child: Text(
                "Hello",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w900,
                  // fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  // color: Colors.blue,
                  // color: Colors.brown.withOpacity(1), // to change to opacity of the text color
                  fontSize: 30, // to change the font size of text
                  height: 2, // this is the hight of the line of the text
                  decoration: TextDecoration.underline,
                  // decoration: TextDecoration.overline,
                  decorationColor: Colors.black,
                  // decorationStyle: TextDecorationStyle.dashed,
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationThickness: 4,
                  // backgroundColor: Colors.red,
                  backgroundColor: Color.fromARGB(255, 200, 100, 100),
                ),
              ),
            ),
            Container(
              child: Text(
                "Hello",
                // TextStyle Stroked text as border
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  foreground:
                      Paint() // forground is to style the border(Stroked) of the text
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.blue,
                ),
              ),
            ),
            Container(
              child: Text(
                "Hello",
                // TextStyle Gradients(ForeGround)
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                      const Offset(0, 20),
                      const Offset(150, 20),
                      <Color>[
                        Colors.red,
                        Colors.yellow,
                      ],
                    ),
                ),
              ),
            ),
            /*---------------------StructStyle-----------------------*/
            Container(
              child: Text(
                "fdsa",
              ),
            ),
            /*---------------------TextDirection-----------------------*/
            Container(
              width: double.infinity,
              child: Text(
                "fdsa fdsaasd fdsa",
                // textDirection: TextDirection.rtl, // this will define how the direction of the text will be in the screen
                textDirection: TextDirection.ltr,
              ),
            ),
            /*---------------------TextOverflow-----------------------*/
            Container(
              width: double.infinity,
              child: Text(
                "fdsa fdsaasd fdsa",
                // overflow: TextOverflow.clip,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
