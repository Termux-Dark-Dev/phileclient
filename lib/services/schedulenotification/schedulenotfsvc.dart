import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class ScheduleNotificationForOrderSvc {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings("looks_logo");

  Future<void> initalizeNotification() async {
    InitializationSettings initalizationsetting =
        InitializationSettings(android: _androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initalizationsetting);
  }

  Future<void> scheduleNotification(String date, String time) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'testod',
      'lokkds',
    );

    NotificationDetails details =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    String dateString = date + time;
    // String dateString = "2023-04-18 8:11 AM";
    DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm a");
    DateTime dateTime = dateFormat.parse(dateString);
    DateTime scheduletime = dateTime.subtract(Duration(minutes: 15));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelid', "channelName",
            importance: Importance.high);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.schedule(
        10839,
        "Time to get new Look",
        "Please reach salon atleast 5 min prior",
        scheduletime,
        notificationDetails);
  }
}
