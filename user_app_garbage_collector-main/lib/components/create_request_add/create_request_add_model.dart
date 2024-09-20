import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_request_add_widget.dart' show CreateRequestAddWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestAddModel extends FlutterFlowModel<CreateRequestAddWidget> {
  ///  Local state fields for this component.

  String? trashType;

  DateTime? datetime;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for trashTypeField widget.
  FormFieldController<String>? trashTypeFieldValueController;
  // State field(s) for trashSubTypeField widget.
  String? trashSubTypeFieldValue;
  FormFieldController<String>? trashSubTypeFieldValueController;
  // State field(s) for driverField widget.
  String? driverFieldValue;
  FormFieldController<String>? driverFieldValueController;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RequestsRow? requestRecord;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get trashTypeFieldValue => trashTypeFieldValueController?.value;
}
