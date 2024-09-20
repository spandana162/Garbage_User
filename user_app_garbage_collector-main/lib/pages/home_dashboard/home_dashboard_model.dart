import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/create_request_add/create_request_add_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'home_dashboard_widget.dart' show HomeDashboardWidget;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeDashboardModel extends FlutterFlowModel<HomeDashboardWidget> {
  ///  Local state fields for this page.

  bool? isLocationNotNull = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFCMToken] action in home_dashboard widget.
  FirebaseMessageModelStruct? firebaseMessageData;
  // Stores action output result for [Backend Call - Update Row(s)] action in home_dashboard widget.
  List<UsersRow>? updatedUser;
  // Stores action output result for [Backend Call - Query Rows] action in home_dashboard widget.
  List<UsersRow>? userData;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
