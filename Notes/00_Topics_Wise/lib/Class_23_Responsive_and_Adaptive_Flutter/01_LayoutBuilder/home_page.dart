import 'responsive_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // so when this widget will render work fine on verticle mode but when we will rotate the application it's doesn't look's good and no responsive at all
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Resp"),
      ),
      body: SafeArea(
        // we will use a save 'SafeArea' because we will going to rotate the application

        child: ResponsiveWidget(
            mobile: Column(
              children: [BuildBannerSlider(), BuildIntroText()],
              // so when this widget will render work fine on verticle mode but when we will rotate the application it's doesn't look's good and no responsive at all
            ),
            tab: Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                BuildBannerSlider(),
                SizedBox(
                  width: 24,
                ),
                Expanded(child: BuildIntroText())
              ],
            ),
            desktop: Row(
              // in here if the width will be grater then the if condition then we will use 'Row' widget rather then 'Column' widget
              children: [
                SizedBox(
                  width: 12,
                ),
                BuildBannerSlider(),
                SizedBox(
                  width: 24,
                ),
                Expanded(child: BuildIntroText())
              ],
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Text BuildIntroText() {
    return Text(
      "Hello everyone 👋\n\n My name is Roman Ojha and i ma a software developer i live in Kathmandu, Nepal and My Githu username is 'RomanOjha-git",
    );
  }

  // ignore: non_constant_identifier_names
  Container BuildBannerSlider() {
    return Container(
      width: 320,
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.pink]),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
