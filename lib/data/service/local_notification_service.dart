import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  LocalNotificationService() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(tz.local.name));
  }

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/todo_icon');
    var iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSettings,
    );
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: null,
        onDidReceiveBackgroundNotificationResponse: null);
  }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'todo_channel_Id', 'Notification name',
            importance: Importance.max,
            priority: Priority.high,
            icon: "@drawable/todo_icon"),
        iOS: DarwinNotificationDetails());
  }

  sceduleNotificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'todo_channel_Id',
          'Notification name',
          channelDescription: 'Notification description',
          importance: Importance.max,
          priority: Priority.high,
          icon: "@drawable/todo_icon",
        ),
        iOS: DarwinNotificationDetails());
  }

  Future<void> testNot() async {
    DateTime dateTime = DateTime.now();
    LocalNotificationService().scheduleNotification(
      title: 'title',
      body: 'description',
      schedule: DateTime(dateTime.year, dateTime.month, dateTime.day,
          dateTime.hour, dateTime.minute + 1),
    );
  }

  Future<void> scheduleNotification({
    int id = 2,
    String? title,
    String? body,
    String? payload,
    required DateTime schedule,
  }) async {
    print('test');
    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(schedule, tz.local),
      await sceduleNotificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exact,
      payload: payload,
    );
  }
}
