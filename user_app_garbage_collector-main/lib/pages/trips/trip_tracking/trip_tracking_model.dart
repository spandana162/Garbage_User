import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'trip_tracking_widget.dart' show TripTrackingWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';

class TripTrackingModel extends FlutterFlowModel<TripTrackingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? TripTrackTImer;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Query cache managers for this widget.

  final _fetchTripDetailsManager = FutureRequestManager<List<TripsRow>>();
  Future<List<TripsRow>> fetchTripDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TripsRow>> Function() requestFn,
  }) =>
      _fetchTripDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchTripDetailsCache() => _fetchTripDetailsManager.clear();
  void clearFetchTripDetailsCacheKey(String? uniqueKey) =>
      _fetchTripDetailsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    TripTrackTImer?.cancel();

    /// Dispose query cache managers for this widget.

    clearFetchTripDetailsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
