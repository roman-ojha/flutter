/*
->  we can have a diferent type of local push notification and they are:
  1) Simple Notifications
    -> in this notification we are just simply notify the use by giving the notification
  2) Schedule Notifications
    -> in this notification we will give the notification after a some time by schedule it, and that also appear when app is closed or in the background
-> to know about the design of push notification you can watch image included in the tutorial
-> for this we will going use 'flutter_local_notifications' package
    -> flutter pub add flutter_local_notifications

1) Simple Notification:
  -> NOTE: to implement for the ios:
      -> firstly we will copy the swift code fromhttps://pub.dev/packages/    flutter_local_notifications#general-setup:
      -> if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    -> and after that we will go to the:
        -> ios/Runner/AppDelegate.swift
        -> and before the return statement we will past the copyed swift code

# Schedule Notifications :
  -> To implement the Schedule Notification:
    
}
*/

import 'package:flutter/material.dart';
import 'notification_api.dart';
import 'page/second_page.dart';

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  Widget buildButton({onClick, String? title}) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(300, 50),
      ),
    );
  }

  void listenNotification() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);

  // here we will create the function to run when we click the notification
  // here inside we will get the payload of the notification
  // so for that when we will click the notification then we wan to navigate to the another page
  void onClickedNotification(String? payload) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecondPage(payload: payload),
        ),
      );

  @override
  void initState() {
    super.initState();
    // here inside we have to call all the init massage from the 'NotificationApi' class
    NotificationApi.init();

    // Scheduled notification:
    // to get work the scheduled notification we have to initialized it:
    NotificationApi.init(initSchedule: true);

    // and then we have to call here a listen notification
    listenNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notification"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow[600],
        child: Column(
          children: [
            Text(
              "Local Notification",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            buildButton(
              // to make the button we have created the Widget
              title: "Simple Notification",
              onClick: () {
                // here we will write the simple notification:
                return NotificationApi.showNotification(
                  // this function has been created in the another file and there we have write the logic to create the notification
                  title: "Roman Ojha",
                  body: "Hello my name is roman ojha",
                  payload: 'roman payload',
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            buildButton(
              title: "Schedule Notification",
              onClick: () {
                // now here we will call the 'showScheduleNotification' function
                NotificationApi.showScheduleNotification(
                  title: "Hello Roman",
                  body: "It's time to exercise",
                  payload: "Exercise right now",
                  scheduleDate: DateTime.now().add(
                    Duration(seconds: 3),
                  ),
                );
                // and we can also display the snackbar to notify that user had scheduled the notification
                // final snackBar = SnackBar(
                //   content: Text(
                //     "Scheduled in 12 Seconds!",
                //     style: TextStyle(fontSize: 24),
                //   ),
                //   backgroundColor: Colors.green,
                // );
                // ScaffoldMessenger.of(context)
                //   ..removeCurrentSnackBar()
                //   ..showSnackBar(snackBar);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            buildButton(
              title: "Remove Notification",
              onClick: () {},
            )
          ],
        ),
      ),
    );
  }
}
