import 'package:vibration/vibration.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notf.dart';

void sensorAlert(
  double? humidity,
  double? co2Ppm, {
    bool vibrationEnabled = true,
    bool notificationsEnabled = true,
  }) {
    if (humidity == null || co2Ppm == null || humidity == 0 || co2Ppm == 0) return;

    if (co2Ppm > 1001 && vibrationEnabled) {
        Vibration.vibrate(duration: 800);
        if (notificationsEnabled) showNotification("🚨 Тривога!", "Рівень CO₂ вищий за норму!");
    } else if (co2Ppm >= 800 && co2Ppm <= 1000 && vibrationEnabled) {
        Vibration.vibrate(duration: 400);
        if (notificationsEnabled) showNotification("⚠️ Увага!", "Рівень CO₂ не значно підвищений");
    }

    if (humidity > 70 && vibrationEnabled) {
        Vibration.vibrate(duration: 300);
        if (notificationsEnabled) showNotification("💧 Волого!", "Рівень вологи вищий за норму");
    } else if (humidity < 30 && vibrationEnabled) {
        Vibration.vibrate(duration: 300);
        if (notificationsEnabled) showNotification("🥵 Сухо!", "Рівень вологи нищий за норму");
        
    }
  }