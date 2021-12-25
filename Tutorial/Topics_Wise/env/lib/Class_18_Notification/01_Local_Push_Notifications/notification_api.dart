import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
// flutter pub add rxdart
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// flutter put add flutter_native_timezone

class NotificationApi {
  // here firstly we have to initialize the local notification package
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    // here we will write how notification will look like in android and ios
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          // 'channel description',
          importance: Importance.max
          // this is the importance of the notification and which is max
          ),
      iOS: IOSNotificationDetails(),
    );
  }

  // next if we will click on our notification it should go to the another page or it should open the page:
  // for that we will create the init function
  static Future init({bool initSchedule = false}) async {
    // here we are creating the android settings
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // and here weare creating some ios settings
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    // then inside we need to call the '_notifications' package
    await _notifications.initialize(
      // we also need to suply here sum settings
      settings,
      // now when you tap the shown notification this 'onSelectNotification' function will exicuted
      // and then we also get the paylod of our notifications
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
        // and we want to add our payload every time to stream
      },
    );

    // Schedule Notification:
    if (initSchedule) {
      // and in here we wan to initialize the timezone
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    // the we can set the show notification message
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        // this id identify notification uniquly
        title,
        body,
        await _notificationDetails(),
        // and here we have to create a notification detail which is '_notificationDetails' function
        payload: payload,
      );
  // Schedule Notification:
  static void showScheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    // for the Schedule Notification we have to call 'zonedSchedule'
    // and after that we can spacifiy the specific time to show notification
    required DateTime scheduleDate,
  }) async {
    _notifications.zonedSchedule(
      id,
      title,
      body,
      // schedule notification after a given second ,minute or hour:
      tz.TZDateTime.from(scheduleDate, tz.local),

      // here we are trying to schedule notification daly at 8 am
      // here now you can sckedule you time based on Time(hour,minute,second)
      // _scheduleDaily(Time(8)),

      // schedule notification on the weekly basis:
      // _scheduleWeekly(Time(8), days: [DateTime.monday, DateTime.tuesday]),
      // here 'monday' and 'tuesday' are the day where we will notify

      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      // matchDateTimeComponents: DateTimeComponents.time,
      // we can also schedule notification on the weekly basis for that we need to put:
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    // so for to schedule Daily we have to create this
    final now = tz.TZDateTime.now(tz.local);
    // 'scheduledDate' is the time when we want to scheduled Our Notification
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(days: 1))
        : scheduledDate;
    // and here we are returning our scheduled notification and also check it here before not in the past already and if it is past then we will add 1 day which will scheduled of the next day
  }

  static tz.TZDateTime _scheduleWeekly(Time time, {required List<int> days}) {
    tz.TZDateTime scheduledDate = _scheduleDaily(time);
    while (!days.contains(scheduledDate.weekday)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }
    return scheduledDate;
  }
}
