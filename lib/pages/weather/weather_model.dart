import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'weather_widget.dart' show WeatherWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherModel extends FlutterFlowModel<WeatherWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetWeatherNowAPI)] action in Weather widget.
  ApiCallResponse? apiResultpe2;
  // Stores action output result for [Backend Call - API (GetWeatherMoreDaysAPI)] action in Weather widget.
  ApiCallResponse? apiResultcvd;
  // Stores action output result for [Backend Call - API (GetWeatherWeekAPI)] action in Weather widget.
  ApiCallResponse? apiResultubq;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
