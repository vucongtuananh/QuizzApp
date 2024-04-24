import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final onClickNotification = BehaviorSubject<String?>();

  //on tap notification

  static void onTapNotification(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }

  static Future init() async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, macOS: initializationSettingsDarwin, linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTapNotification,
      onDidReceiveBackgroundNotificationResponse: onTapNotification,
    );
  }

  //show a schedule notification

  static void showScheduleNotification({
    required int id,
    required String? title,
    required String? body,
    required String? payload,
    required DateTime schduleDate,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(schduleDate, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails('your channel id', 'your channel name', channelDescription: 'your channel description'),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }

  //show a simple notification

  static void showSimpleNotification({
    required int id,
    required String? title,
    required String? body,
    required String? payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
