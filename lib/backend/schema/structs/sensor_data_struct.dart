// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SensorDataStruct extends BaseStruct {
  SensorDataStruct({
    double? temperatureC,
    double? temperatureF,
    double? temperatureK,
    int? humidity,
    double? co2Ppm,
    int? co2Percent,
    int? light,
    String? timestamp,
  })  : _temperatureC = temperatureC,
        _temperatureF = temperatureF,
        _temperatureK = temperatureK,
        _humidity = humidity,
        _co2Ppm = co2Ppm,
        _co2Percent = co2Percent,
        _light = light,
        _timestamp = timestamp;

  // "temperatureC" field.
  double? _temperatureC;
  double get temperatureC => _temperatureC ?? 0.0;
  set temperatureC(double? val) => _temperatureC = val;

  void incrementTemperatureC(double amount) =>
      temperatureC = temperatureC + amount;

  bool hasTemperatureC() => _temperatureC != null;

  // "temperatureF" field.
  double? _temperatureF;
  double get temperatureF => _temperatureF ?? 0.0;
  set temperatureF(double? val) => _temperatureF = val;

  void incrementTemperatureF(double amount) =>
      temperatureF = temperatureF + amount;

  bool hasTemperatureF() => _temperatureF != null;

  // "temperatureK" field.
  double? _temperatureK;
  double get temperatureK => _temperatureK ?? 0.0;
  set temperatureK(double? val) => _temperatureK = val;

  void incrementTemperatureK(double amount) =>
      temperatureK = temperatureK + amount;

  bool hasTemperatureK() => _temperatureK != null;

  // "humidity" field.
  int? _humidity;
  int get humidity => _humidity ?? 0;
  set humidity(int? val) => _humidity = val;

  void incrementHumidity(int amount) => humidity = humidity + amount;

  bool hasHumidity() => _humidity != null;

  // "co2Ppm" field.
  double? _co2Ppm;
  double get co2Ppm => _co2Ppm ?? 0.0;
  set co2Ppm(double? val) => _co2Ppm = val;

  void incrementCo2Ppm(double amount) => co2Ppm = co2Ppm + amount;

  bool hasCo2Ppm() => _co2Ppm != null;

  // "co2Percent" field.
  int? _co2Percent;
  int get co2Percent => _co2Percent ?? 0;
  set co2Percent(int? val) => _co2Percent = val;

  void incrementCo2Percent(int amount) => co2Percent = co2Percent + amount;

  bool hasCo2Percent() => _co2Percent != null;

  // "light" field.
  int? _light;
  int get light => _light ?? 0;
  set light(int? val) => _light = val;

  void incrementLight(int amount) => light = light + amount;

  bool hasLight() => _light != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '0';
  set timestamp(String? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  static SensorDataStruct fromMap(Map<String, dynamic> data) =>
      SensorDataStruct(
        temperatureC: castToType<double>(data['temperatureC']),
        temperatureF: castToType<double>(data['temperatureF']),
        temperatureK: castToType<double>(data['temperatureK']),
        humidity: castToType<int>(data['humidity']),
        co2Ppm: castToType<double>(data['co2Ppm']),
        co2Percent: castToType<int>(data['co2Percent']),
        light: castToType<int>(data['light']),
        timestamp: data['timestamp'] as String?,
      );

  static SensorDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SensorDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'temperatureC': _temperatureC,
        'temperatureF': _temperatureF,
        'temperatureK': _temperatureK,
        'humidity': _humidity,
        'co2Ppm': _co2Ppm,
        'co2Percent': _co2Percent,
        'light': _light,
        'timestamp': _timestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'temperatureC': serializeParam(
          _temperatureC,
          ParamType.double,
        ),
        'temperatureF': serializeParam(
          _temperatureF,
          ParamType.double,
        ),
        'temperatureK': serializeParam(
          _temperatureK,
          ParamType.double,
        ),
        'humidity': serializeParam(
          _humidity,
          ParamType.int,
        ),
        'co2Ppm': serializeParam(
          _co2Ppm,
          ParamType.double,
        ),
        'co2Percent': serializeParam(
          _co2Percent,
          ParamType.int,
        ),
        'light': serializeParam(
          _light,
          ParamType.int,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
      }.withoutNulls;

  static SensorDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      SensorDataStruct(
        temperatureC: deserializeParam(
          data['temperatureC'],
          ParamType.double,
          false,
        ),
        temperatureF: deserializeParam(
          data['temperatureF'],
          ParamType.double,
          false,
        ),
        temperatureK: deserializeParam(
          data['temperatureK'],
          ParamType.double,
          false,
        ),
        humidity: deserializeParam(
          data['humidity'],
          ParamType.int,
          false,
        ),
        co2Ppm: deserializeParam(
          data['co2Ppm'],
          ParamType.double,
          false,
        ),
        co2Percent: deserializeParam(
          data['co2Percent'],
          ParamType.int,
          false,
        ),
        light: deserializeParam(
          data['light'],
          ParamType.int,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SensorDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SensorDataStruct &&
        temperatureC == other.temperatureC &&
        temperatureF == other.temperatureF &&
        temperatureK == other.temperatureK &&
        humidity == other.humidity &&
        co2Ppm == other.co2Ppm &&
        co2Percent == other.co2Percent &&
        light == other.light &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        temperatureC,
        temperatureF,
        temperatureK,
        humidity,
        co2Ppm,
        co2Percent,
        light,
        timestamp
      ]);
}

SensorDataStruct createSensorDataStruct({
  double? temperatureC,
  double? temperatureF,
  double? temperatureK,
  int? humidity,
  double? co2Ppm,
  int? co2Percent,
  int? light,
  String? timestamp,
}) =>
    SensorDataStruct(
      temperatureC: temperatureC,
      temperatureF: temperatureF,
      temperatureK: temperatureK,
      humidity: humidity,
      co2Ppm: co2Ppm,
      co2Percent: co2Percent,
      light: light,
      timestamp: timestamp,
    );
