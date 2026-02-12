import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['uk', 'en', 'pl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ukText = '',
    String? enText = '',
    String? ruText = '',
  }) =>
      [ukText, enText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Climate
  {
    'ybb7qjn1': {
      'uk': 'Зараз у приміщенні:',
      'en': 'Now in room:',
      'pl': 'Teraz w pokoju:',
    },
    'uerksjsf': {
      'uk': '°C', 
      'en': '°C',
      'pl': '°C',
    },
    '6dgj46yz': {
      'uk': '°F',
      'en': '°F',
      'pl': '°F',
    },
    '8ng6n368': {
      'uk': 'K',
      'en': 'K',
      'pl': 'K',
    },
    'wvzoe0fe': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'dw8ui3tl': {
      'uk': 'Волога',
      'en': 'Humidity',
      'pl': 'Wilgoć',
    },
    'xkusizqk': {
      'uk': '----',
      'en': '----',
      'pl': '----',
    },
    'x1k979x3': {
      'uk': ' гПа',
      'en': ' hPa',
      'pl': 'hPa',
    },
    'obv0qeif': {
      'uk': 'Атмосферний Тиск',
      'en': 'Pressure',
      'pl': 'ciśnienie atmosferyczne',
    },
    'm93zob2t': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'ucdnn3h8': {
      'uk': 'CO2',
      'en': 'CO2',
      'pl': 'CO2',
    },
    'kl04ziha': {
      'uk': ' Ppm',
      'en': ' Ppm',
      'pl': ' Ppm',
    },
    'dllbrp60': {
      'uk': 'CO2',
      'en': 'CO2',
      'pl': 'CO2',
    },
    '3c7sei2z': {
      'uk': '%',
      'en': '%',
      'pl': '^',
    },
    'rqg61943': {
      'uk': 'Освітленість',
      'en': 'Light',
      'pl': 'światło',
    },
    'py2yozsn': {
      'uk': 'Стан приміщення:',
      'en': 'Room condition:',
      'pl': 'Stan pokoju:',
    },
    'fvnnegdy': {
      'uk': 'Немає зв\'язку з ESP32 :(',
      'en': 'No connection with ESP32 :(',
      'pl': 'Brak połączenia z ESP32 :(',
    },
    'byjqa5x2': {
      'uk': 'Будь ласка, перевірте з\'єднання!',
      'en': 'Please, check your connection',
      'pl': 'Brak połączenia z ESP32 :(',
    },
    '3n01qtn7': {
      'uk': 'CLIMATE VIEWER',
      'en': 'CLIMATE VIEWER',
      'pl': 'CLIMATE VIEWER',
    },
    'b3ivcpzp': {
      'uk': 'У кімнаті',
      'en': 'In room',
      'pl': 'W pokoju',
    },
    'air_allgood_desc': {
      'uk': 'Все добре :D',
      'en': 'All nice :D',
      'pl': 'Bardzo dobrze :D',
    },
    'air_allgood2_desc': {
      'uk': 'Причин для тривоги не має',
      'en': 'No reasons for panic',
      'pl': 'Nie ma powodu do niepokoju',
    },
    'air_warning_desc': {
      'uk': 'Увага!',
      'en': 'Warning!',
      'pl': 'Uwaga!',
    },
    'air_warning2_desc': {
      'uk': 'CO2 перебуває трохи вище норми (CO2 > 800 ppm)',
      'en': 'CO2 is slightly above normal (CO2 > 800 ppm)',
      'pl': 'CO2 jest nieco powyżej normy (CO2) > 800 ppm)',
    },
    'air_bad_desc': {
      'uk': '! ТРИВОГА !',
      'en': '! Alarm !',
      'pl': '! Alarm !',
    },
    'air_bad2_desc': {
      'uk': 'CO2 перебуває значно вище норми! (CO2 > 1200ppm)',
      'en': 'CO2 is well above normal! (CO2 > 1200ppm)',
      'pl': 'CO2 jest znacznie powyżej normy! (CO2 > 1200ppm)',
    },
    'air_dry_desc': {
      'uk': 'Дуже сухо!',
      'en': 'Too dry!',
      'pl': 'bardzo suchy!',
    },
    'air_dry2_desc': {
      'uk': 'У приміщенні волога є меншою за норму',
      'en': 'humidity in the room is lower than normal',
      'pl': 'Wilgotność w pomieszczeniu jest niższa niż normalnie',
    },
    'air_wet_desc': {
      'uk': 'Дуже волого!',
      'en': 'Too humid!',
      'pl': 'bardzo wilgotno',
    },
    'air_wet2_desc': {
      'uk': 'У приміщенні волога є вище за норму',
      'en': 'humidity in the room is higher than normal',
      'pl': 'Wilgotność w pomieszczeniu jest wyższa niż normalnie.',
    }
  },
  // Weather
  {
    'o5hhdsbi': {
      'uk': 'CLIMATE VIEWER',
      'en': 'CLIMATE VIEWER',
      'pl': 'CLIMATE VIEWER',
    },
    'd0l7qcm9': {
      'uk': 'СЬОГОДНІ',
      'en': 'TODAY',
      'pl': 'DZISIAJ',
    },
    'actm5scw': {
      'uk': 'м. Львів',
      'en': 'Lviv city',
      'pl': 'Miasto Lwów',
    },
    '6l868sed': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '9gifhvs0': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'hl0oopfc': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'k45l1dt7': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'gwlxwesq': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'oog8nsbb': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'sh3z6dqk': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'sdkw49ct': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'lkr31alx': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '2t4yxdk0': {
      'uk': 'ІНША ІНФОРМАЦІЯ',
      'en': 'ANOTHER INFORMATION',
      'pl': 'INNE INFORMACJE',
    },
    'ujflk2af': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'wdjlgnqk': {
      'uk': 'Волога',
      'en': 'Humidity',
      'pl': 'Wilgoć',
    },
    'n790aem3': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'vmk168c0': {
      'uk': 'Відчувається',
      'en': 'Feels like',
      'pl': 'Czuję się jak',
    },
    '4ytakjcm': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'uevbl3nz': {
      'uk': 'Швидкість вітру',
      'en': 'Speed of wind',
      'pl': 'Prędkość wiatru',
    },
    '5k8rybnv': {
      'uk': 'Напрям вітру',
      'en': 'Deg of wind',
      'pl': 'Kierunek wiatru',
    },
    'pxtvi4su': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    '5khg1ju1': {
      'uk': 'Хмарність',
      'en': 'Clouds',
      'pl': 'Zachmurzenie',
    },
    'cao0e2kx': {
      'uk': ' км',
      'en': ' km',
      'pl': ' km',
    },
    'hzubbvwe': {
      'uk': 'Видимість',
      'en': 'Visibility',
      'pl': 'Widoczność',
    },
    'n4b6l5vu': {
      'uk': ' гПа',
      'en': ' hPa',
      'pl': ' hPa',
    },
    'z7opmclp': {
      'uk': 'Атмосферний тиск',
      'en': 'Pressure',
      'pl': 'Ciśnienie atmosferyczne',
    },
    'mdyjp665': {
      'uk': 'НА ТИЖДЕНЬ',
      'en': 'ON WEEK',
      'pl': 'NA TYDZIEŃ',
    },
    'k1q0dhcq': {
      'uk': 'Завтра',
      'en': 'Tomorrow',
      'pl': 'Jutro',
    },
    'pf1npvtj': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'ap77hvsg': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'q8dmx8wl': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'hjrsjt5w': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'z1l7foip': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'lvhghamy': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '101d5hic': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'iooo74vo': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'iklklxz2': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '39gn0mfn': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'qmopjvj3': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    '4z9u511m': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'kuvoiri3': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'c46eac1j': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '0uojo2iz': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'ydqg5uoh': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    '5yz5jh2m': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'k50kxolo': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'r5493fin': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    '6uwrzd6x': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    '2ls9201u': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'u82c15yu': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    'efmjg23t': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    's03m7xq0': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'cv4ev72z': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '4df0fef3': {
      'uk': '°C',
      'en': '°C',
      'pl': '°C',
    },
    '8wpmpph0': {
      'uk': '%',
      'en': '%',
      'pl': '%',
    },
    'i8rusojo': {
      'uk': ' м/c',
      'en': ' m/s',
      'pl': ' m/s',
    },
    'pmhnjyy6': {
      'uk': 'ДЕТАЛЬНІШЕ',
      'en': 'DETAILED',
      'pl': 'Szczegółowo',
    },
    'j1cijlep': {
      'uk': 'Для того, щоб побачити додаткові, або більш деталньі синоптичні дані, будь ласка перейдіть за посиланням нижче.\n\nДля відображеня погодих даних ми використовуємо OpenWeather API, це дозволяє стабільно передавати дані на девайс.',
      'en': 'To see additional or more detailed weather data, please follow the link below.\n\nWe use the OpenWeather API to display weather data, this allows for stable data transfer to the device.',
      'pl': 'Aby zobaczyć dodatkowe lub bardziej szczegółowe dane pogodowe, kliknij poniższy link.\n\nDo wyświetlania danych pogodowych używamy interfejsu API OpenWeather, co pozwala na stabilny przesył danych do urządzenia.',
    },
    'lomsqn6n': {
      'uk': 'Перейти',
      'en': 'Go it',
      'pl': 'Iść',
    },
    'osq5z3pm': {
      'uk': 'Погода',
      'en': 'Weather',
      'pl': 'Pogoda',
    },
  },
  // Settings
  {
    '2r7018ou': {
      'uk': 'CLIMATE VIEWER',
      'en': 'CLIMATE VIEWER',
      'pl': 'CLIMATE VIEWER',
    },
    '4gbmvlra': {
      'uk': 'v1.0.0',
      'en': 'v1.0.0',
      'pl': 'v1.0.0',
    },
    'h0n55p07': {
      'uk': 'Налаштування',
      'en': 'Settings',
      'pl': 'Ustawienia',
    },
    'es7hgt31': {
      'uk': 'Вібрація',
      'en': 'Vibration',
      'pl': 'Wibracja',
    },
    'xy3ya759': {
      'uk': 'Сповіщення',
      'en': 'Notifications',
      'pl': 'Powiadomienie',
    },
    'nyn2j5xt': {
      'uk': 'Українська',
      'en': 'English',
      'pl': 'Polski',
    },
    '4ds6xcar': {
      'uk': 'Налаштування',
      'en': 'Settings',
      'pl': 'Ustawienia',
    },
  },
  // Miscellaneous
  {
    'iqtdtsb4': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'iojdw1r9': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '9jzpkgtf': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'bsixmtma': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '59s77101': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'ob3vifr0': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '27enjoob': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '0nhamudg': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'il80181w': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '4eqtdxau': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'ub5jexzp': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'lb17s09j': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'd7s09h6k': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'js6ewfvz': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '5npvg30l': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'ecnhui97': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'mkpoz858': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'dpn9e4iw': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '4gvjq8da': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'txhhs5jc': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '9o09t13o': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'z1y4trfl': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    '141ghcqw': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'uujwswmv': {
      'uk': '',
      'en': '',
      'pl': '',
    },
    'sh8f3xrn': {
      'uk': '',
      'en': '',
      'pl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
