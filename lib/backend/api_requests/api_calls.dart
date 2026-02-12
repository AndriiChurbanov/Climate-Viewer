import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ClimateViewerAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ClimateViewerAPI',
      apiUrl: 'https://onionlike-noncuratively-shizuko.ngrok-free.dev/api.php',
      callType: ApiCallType.GET,
      headers: {
        'ngrok-skip-browser-warning': 'true',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? temperatureC(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.temperatureC''',
      ));
  static double? temperatureF(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.temperatureF''',
      ));
  static double? temperatureK(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.temperatureK''',
      ));
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.humidity''',
      ));
  static double? co2Ppm(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.co2Ppm''',
      ));
  static int? co2Percent(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.co2Percent''',
      ));
  static int? light(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.light''',
      ));
  static String? timestamp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.timestamp''',
      ));
}

class GetWeatherNowAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeatherNowAPI',
      apiUrl:
          'http://api.openweathermap.org/data/2.5/weather?q=Lviv&appid=8de8b7afe91a96d7ae94bc72c85670b9&units=metric&lang=ua',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? temp(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static int? feelsLike(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.feels_like''',
      ));
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static int? visibility(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.visibility''',
      ));
  static int? pressure(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.pressure''',
      ));
  static int? speed(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.wind.speed''',
      ));
  static int? deg(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.wind.deg''',
      ));
  static int? clouds(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.clouds.all''',
      ));
  static String? weather(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].main''',
      ));
}

class GetWeatherMoreDaysAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeatherMoreDaysAPI',
      apiUrl:
          'http://api.openweathermap.org/data/2.5/forecast?q=Lviv&appid=8de8b7afe91a96d7ae94bc72c85670b9&units=metric&lang=ua',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<double>? temp(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].main.temp''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? feelsLike(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].main.feels_like''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? pressure(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].main.pressure''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? humidity(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].main.humidity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? main(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[:].main''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? clouds(dynamic response) => getJsonField(
        response,
        r'''$.list[:].clouds''',
        true,
      ) as List?;
  static List<int>? deg(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].wind.deg''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? visibility(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].visibility''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<double>? speed(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].wind.speed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].dt_txt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetWeatherWeekAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeatherWeekAPI',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/forecast/daily?lat=49.8383&lon=24.0232&cnt=16&appid=8de8b7afe91a96d7ae94bc72c85670b9&units=metric&lang=ua',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? date(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].dt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? temp(dynamic response) => getJsonField(
        response,
        r'''$.list[:].temp''',
        true,
      ) as List?;
  static List<double>? tempDay(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].temp.day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? tempNight(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].temp.night''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<int>? humidity(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].humidity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? weatherMain(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].weather[:].main''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? speed(dynamic response) => (getJsonField(
        response,
        r'''$.list[:].speed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
