import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_widget.dart' show RegisterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterModel extends FlutterFlowModel<RegisterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullNameText widget.
  FocusNode? fullNameTextFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for muinicipalities widget.
  String? muinicipalitiesValue;
  FormFieldController<String>? muinicipalitiesValueController;
  // State field(s) for phoneNumberText widget.
  FocusNode? phoneNumberTextFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for emailAddressTex widget.
  FocusNode? emailAddressTexFocusNode;
  TextEditingController? emailAddressTexController;
  String? Function(BuildContext, String?)? emailAddressTexControllerValidator;
  // State field(s) for passwordText widget.
  FocusNode? passwordTextFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordTextVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirmPasswordText widget.
  FocusNode? confirmPasswordTextFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordTextVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordTextVisibility = false;
    confirmPasswordTextVisibility = false;
  }

  @override
  void dispose() {
    fullNameTextFocusNode?.dispose();
    fullNameTextController?.dispose();

    phoneNumberTextFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailAddressTexFocusNode?.dispose();
    emailAddressTexController?.dispose();

    passwordTextFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordTextFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
