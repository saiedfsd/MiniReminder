import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static const NOTIFICATION_ID = 'reminders_channel';
  static const NOTIFICATION_NAME = 'Reminders';

  static Future<void> initialize() async {
    tz.initializeTimeZones();
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(initializationSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        NOTIFICATION_ID,
        NOTIFICATION_NAME,
        description: 'Channel for Reminder Notifications',
        importance: Importance.high,
        playSound: true
    );

    await _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> scheduleNotification(int id, String title, String category, DateTime scheduledTime) async {
    const androidDetails = AndroidNotificationDetails(NOTIFICATION_ID, NOTIFICATION_NAME,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true);

    final notificationDetails = NotificationDetails(android: androidDetails);
    if(scheduledTime.isBefore(DateTime.now())){

    }else{
      await _notificationsPlugin.zonedSchedule(
        id,
        title,
        category,
        tz.TZDateTime.from(scheduledTime, tz.local),
        notificationDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }

  }

  static Future<void> cancelNotification(int id) async{
    await _notificationsPlugin.cancel(id);
  }
}