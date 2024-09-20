import '/backend/supabase/supabase.dart';
import '/components/create_request_add/create_request_add_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'requests_widget.dart' show RequestsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestsModel extends FlutterFlowModel<RequestsWidget> {
  ///  Local state fields for this page.

  List<RequestsRow> requestsLisy = [];
  void addToRequestsLisy(RequestsRow item) => requestsLisy.add(item);
  void removeFromRequestsLisy(RequestsRow item) => requestsLisy.remove(item);
  void removeAtIndexFromRequestsLisy(int index) => requestsLisy.removeAt(index);
  void insertAtIndexInRequestsLisy(int index, RequestsRow item) =>
      requestsLisy.insert(index, item);
  void updateRequestsLisyAtIndex(int index, Function(RequestsRow) updateFn) =>
      requestsLisy[index] = updateFn(requestsLisy[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for status widget.
  FormFieldController<List<String>>? statusValueController;
  String? get statusValue => statusValueController?.value?.firstOrNull;
  set statusValue(String? val) =>
      statusValueController?.value = val != null ? [val] : [];
  bool requestCompleted = false;
  String? requestLastUniqueKey;

  /// Query cache managers for this widget.

  final _fetchRequestsManager = FutureRequestManager<List<RequestsRow>>();
  Future<List<RequestsRow>> fetchRequests({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RequestsRow>> Function() requestFn,
  }) =>
      _fetchRequestsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchRequestsCache() => _fetchRequestsManager.clear();
  void clearFetchRequestsCacheKey(String? uniqueKey) =>
      _fetchRequestsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();

    /// Dispose query cache managers for this widget.

    clearFetchRequestsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
