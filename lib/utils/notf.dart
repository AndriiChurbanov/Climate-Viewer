import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vibration/vibration.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

bool enableVibration = true;
bool enableNotification = true;

/// Ініціалізація сповіщень
Future<void> initNotifications() async {
  const androidSettings = AndroidInitializationSettings('@mipmap/app_icon');

  const settings = InitializationSettings(android: androidSettings);

  await flutterLocalNotificationsPlugin.initialize(
    settings: settings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print('Tapped notification: ${response.payload}');
    },
  );
}

/// Показ сповіщення
Future<void> showNotification(String title, String body) async {
  if (!enableNotification) return;

  const androidDetails = AndroidNotificationDetails(
    'sensor_channel',           // id каналу
    'Sensor Alerts',            // назва
    channelDescription: 'Сповіщення про стан повітря',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    icon: '@mipmap/app_icon',
  );

  const details = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    id: 0,
    title: title,
    body: body,
    notificationDetails: details,
    payload: 'sensor_alert',
  );

  if (enableVibration) {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 500);
    }
  }
}
