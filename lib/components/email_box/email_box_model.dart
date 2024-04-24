import '/flutter_flow/flutter_flow_util.dart';
import 'email_box_widget.dart' show EmailBoxWidget;
import 'package:flutter/material.dart';

class EmailBoxModel extends FlutterFlowModel<EmailBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
