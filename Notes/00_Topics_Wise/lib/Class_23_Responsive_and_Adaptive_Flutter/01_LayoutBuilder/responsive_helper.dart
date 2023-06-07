import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  // here we will accept three widget:
  final Widget mobile;
  final Widget tab;
  final Widget desktop;

  const ResponsiveWidget(
      {Key? key,
      required this.mobile,
      required this.tab,
      required this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // to make responseve we have to wrap child with the layout builder
      // with the layoutbuilder we will get the constrant of size

      // now we will provide the abstraction to the layoutbuilder for that we will create the helper method which will be responsivle for changing all the layout
      // we will pass different layout which will need for the different form factor
      builder: (context, constraints) {
        if (constraints.maxWidth < 680) {
          // in this case because of older emulator we have use '680 px'
          // here if the width is less the '768 px' then it could be mobile app
          // then we will return the widget which is based on that mobile factor
          return mobile;
        } else {
          // else it is in the potrate mode
          return tab;
        }
      },
    );
  }
}
