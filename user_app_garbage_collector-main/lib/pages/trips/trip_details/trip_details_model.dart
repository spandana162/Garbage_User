import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/request_manager.dart';

import 'trip_details_widget.dart' show TripDetailsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TripDetailsModel extends FlutterFlowModel<TripDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Query cache managers for this widget.

  final _fetchTripInfoManager =
      FutureRequestManager<List<TripDetailsViewRow>>();
  Future<List<TripDetailsViewRow>> fetchTripInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TripDetailsViewRow>> Function() requestFn,
  }) =>
      _fetchTripInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchTripInfoCache() => _fetchTripInfoManager.clear();
  void clearFetchTripInfoCacheKey(String? uniqueKey) =>
      _fetchTripInfoManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearFetchTripInfoCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
