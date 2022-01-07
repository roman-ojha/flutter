import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogClass extends StatefulWidget {
  const AlertDialogClass({Key? key}) : super(key: key);

  @override
  AlertDialogClassState createState() => AlertDialogClassState();
}

class AlertDialogClassState extends State<AlertDialogClass> {
  String alertDialogValue = "NaN";
  String cupertinoAlertDialogValue = "NaN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Allert Dialog"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Alert Dialog Value: $alertDialogValue",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("AlertDialog"),
              onPressed: () => showDialog(
                // Building Eleveted Button AlertDilog
                context: context,
                barrierColor: Colors.blueAccent,
                // page color while in alert dialog
                barrierDismissible: false,
                // can't be able to cancle the alert dialog by pressing outside alert dialog
                barrierLabel: "Hello",
                builder: (BuildContext context) => AlertDialog(
                  title: Text("Accept?"),
                  content: Text("Do you accept"),
                  elevation: 24.0,
                  backgroundColor: Colors.red,
                  // shape: CircleBorder(),
                  actions: [
                    // Action that we want to perform when dialog appere
                    ElevatedButton(
                      child: Text("No"),
                      onPressed: () {
                        setState(() {
                          alertDialogValue = "No";
                        });
                        return Navigator.pop(context, "No");
                      },
                    ),
                    ElevatedButton(
                      child: Text("Yes"),
                      onPressed: () {
                        setState(() {
                          alertDialogValue = "Yes";
                        });
                        return Navigator.pop(context, "Yess");
                      },
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Cupertino Alert Dialog Value: $cupertinoAlertDialogValue",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              // Building CupertinoAlertdialog
              child: Text("CupertinoAllertDialog"),
              onPressed: () => showCupertinoDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text("Accept"),
                  content: Text("Do you accept?"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("No"),
                      onPressed: () {
                        setState(() {
                          cupertinoAlertDialogValue = "No";
                        });
                        return Navigator.pop(context, "No");
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Yes"),
                      onPressed: () {
                        setState(() {
                          cupertinoAlertDialogValue = "Yes";
                        });
                        return Navigator.pop(context, "Yess");
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
