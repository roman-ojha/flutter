import 'package:flutter/material.dart';

class SnackBarClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to use TabBar first create DevaultTabController
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar Class"),
        ),
        body: Column(
          children: [
            Builder(
              // Building SnackBar when pressing the button
              builder: (context) => ElevatedButton(
                child: Text("Show Snack Bar"),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Hello"),
                      action: SnackBarAction(
                        // An action that the user can take based on the snack bar.
                        onPressed: () {},
                        label: "More Detail",
                        textColor: Colors.red,
                        disabledTextColor: Colors.white,
                        // The button disabled label color. This color is shown after the SnackBarAction is dismissed.
                      ),
                      animation: null,
                      // The animation driving the entrance and exit of the snack bar.
                      backgroundColor: Colors.grey,
                      // color of the snack bar background
                      // behavior: SnackBarBehavior.fixed, // default
                      behavior: SnackBarBehavior.floating,
                      // This defines the behavior and location of the snack bar
                      duration: Duration(seconds: 5),
                      // The amount of time the snack bar should be displayed
                      elevation: 10,
                      // The z-coordinate at which to place the snack bar. This controls the size of the shadow below the snack bar.
                      onVisible: () {
                        // Called this function at the first time when the snackbar is visible within a Scaffold.
                        print("Visible");
                      },
                      padding: EdgeInsets.all(10),
                      // shape: null,
                      // The shape of the snack bar's Material.
                      width: 300,
                      // margin: EdgeInsets.all(40),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
