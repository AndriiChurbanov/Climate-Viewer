// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeatherDataStruct extends BaseStruct {
  WeatherDataStruct({
    double? temperatureNow,
  }) : _temperatureNow = temperatureNow;

  // "TemperatureNow" field.
  double? _temperatureNow;
  double get temperatureNow => _temperatureNow ?? 0.0;
  set temperatureNow(double? val) => _temperatureNow = val;

  void incrementTemperatureNow(double amount) =>
      temperatureNow = temperatureNow + amount;

  bool hasTemperatureNow() => _temperatureNow != null;

  static WeatherDataStruct fromMap(Map<String, dynamic> data) =>
      WeatherDataStruct(
        temperatureNow: castToType<double>(data['TemperatureNow']),
      );

  static WeatherDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WeatherDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'TemperatureNow': _temperatureNow,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TemperatureNow': serializeParam(
          _temperatureNow,
          ParamType.double,
        ),
      }.withoutNulls;

  static WeatherDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeatherDataStruct(
        temperatureNow: deserializeParam(
          data['TemperatureNow'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WeatherDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeatherDataStruct && temperatureNow == other.temperatureNow;
  }

  @override
  int get hashCode => const ListEquality().hash([temperatureNow]);
}

WeatherDataStruct createWeatherDataStruct({
  double? temperatureNow,
}) =>
    WeatherDataStruct(
      temperatureNow: temperatureNow,
    );
