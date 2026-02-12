import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

int? returnIntForWeather(double? value) {
  if (value == null) return null;
  return value.round();
}

String returnForDate(String? dateTimeString) {
  if (dateTimeString == null) {
    return "--:--";
  }

  try {
    DateTime dt = DateTime.parse(dateTimeString.toString());
    return DateFormat('HH:mm').format(dt);
  } catch (e) {
    return "--:--";
  }
}

String windDeg(int? deg) {
  if (deg == null) return "--";

  // ділимо коло на 8 секторів
  if (deg >= 337.5 || deg < 22.5) return "Пн"; // North
  if (deg >= 22.5 && deg < 67.5) return "Пн-Сх"; // NE
  if (deg >= 67.5 && deg < 112.5) return "Сх"; // E
  if (deg >= 112.5 && deg < 157.5) return "Пд-Сх"; // SE
  if (deg >= 157.5 && deg < 202.5) return "Пд"; // S
  if (deg >= 202.5 && deg < 247.5) return "Пд-Зх"; // SW
  if (deg >= 247.5 && deg < 292.5) return "Зх"; // W
  if (deg >= 292.5 && deg < 337.5) return "Пн-Зх"; // NW

  return "--"; // fallback
}

String visibleKM(int? visible) {
  if (visible == null) return "--"; // якщо даних немає
  return "${(visible / 1000).toStringAsFixed(0)}"; // перетворюємо метри у км
}

String weatherIcon(String weatherMain) {
  final hour = DateTime.now().hour;
  final isNight = hour < 6 || hour >= 18;

  switch (weatherMain.toLowerCase()) {
    case "clear":
      return isNight ? 'assets/icons/moon.png' : 'assets/icons/sun.png';
    case "clouds":
      return 'assets/icons/clouds.png';
    case "rain":
      return 'assets/icons/rainy.jpg';
    case "thunder":
      return 'assets/icons/thunder.png';
    case "snow":
      return 'assets/icons/snow.png';
    default:
      return 'assets/icons/default.png';
  }
}

String returnForDate2(int? dateDateString) {
  if (dateDateString == null) {
    return "--.--";
  }

  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dateDateString * 1000);
    return DateFormat('dd.MM').format(date);
  } catch (e) {
    return "--.--";
  }
}

String retrurnToWeek(int? weekString) {
  if (weekString == null) return "--";

  try {
    // dt у секундах → переводимо в мілісекунди
    DateTime date = DateTime.fromMillisecondsSinceEpoch(weekString * 1000);

    // 'EEEE' повертає повну назву дня тижня, локалізація 'uk' українська
    String weekday = DateFormat('EEEE', 'uk').format(date);

    // Можна скоротити до 2 літер: "Пн", "Вт", ...
    Map<String, String> shortWeekdays = {
      'понеділок': 'Пн',
      'вівторок': 'Вт',
      'середа': 'Ср',
      'четвер': 'Чт',
      'пʼятниця': 'Пт',
      'субота': 'Сб',
      'неділя': 'Нд',
    };

    return shortWeekdays[weekday.toLowerCase()] ?? weekday;
  } catch (e) {
    return "--";
  }
}

String sensorImage(double? humidity, double? co2Ppm) {
  if (humidity == null || co2Ppm == null || humidity == 0 || co2Ppm == 0) {
    return 'assets/icons/default.png';
  }

  if (co2Ppm > 1001) return 'assets/icons/alarm.png';
  if (co2Ppm >= 800 && co2Ppm <= 1000) return 'assets/icons/warning.png';
  if (humidity < 30) return 'assets/icons/dry.png';
  if (humidity > 70) return 'assets/icons/humid.png';

  return 'assets/icons/good.png';
}


String sensorTitle(double? humidity, double? co2Ppm) {
  if (humidity == null || co2Ppm == null || humidity == 0 || co2Ppm == 0) {
    return 'fvnnegdy';
  }

  if (co2Ppm > 1001) return 'air_bad_desc';
  if (co2Ppm >= 800 && co2Ppm <= 1000) return 'air_warning_desc';
  if (humidity < 30) return 'air_dry_desc';
  if (humidity > 70) return 'air_wet_desc';

  return 'air_allgood_desc';
}

String sensorSubtitle(double? humidity, double? co2Ppm) {
  if (humidity == null || co2Ppm == null || humidity == 0 || co2Ppm == 0) {
    return 'byjqa5x2';
  }

  if (co2Ppm > 1001) return 'air_bad2_desc';
  if (co2Ppm >= 800 && co2Ppm <= 1000) return 'air_warning2_desc';
  if (humidity < 30) return 'air_dry2_desc';
  if (humidity > 70) return 'air_wet2_desc';

  return 'air_allgood2_desc';
}

String getFlagForLocale(BuildContext context) {
  final languageCode = Localizations.localeOf(context).languageCode;

  final flags = {
    'uk': 'assets/images/ukraine.png',
    'en': 'assets/images/britain.png',
    'pl': 'assets/images/poland.png',
  };

  return flags[languageCode] ?? 'assets/images/default.png';
}