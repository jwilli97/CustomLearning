import '/components/email_box/email_box_widget.dart';
import '/components/name_box/name_box_widget.dart';
import '/components/password_box/password_box_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NameBox component.
  late NameBoxModel nameBoxModel1;
  // Model for EmailBox component.
  late EmailBoxModel emailBoxModel1;
  // Model for PasswordBox component.
  late PasswordBoxModel passwordBoxModel1;
  // Model for PasswordBox component.
  late PasswordBoxModel passwordBoxModel2;
  // Model for NameBox component.
  late NameBoxModel nameBoxModel2;
  // Model for EmailBox component.
  late EmailBoxModel emailBoxModel2;
  // Model for PasswordBox component.
  late PasswordBoxModel passwordBoxModel3;
  // Model for PasswordBox component.
  late PasswordBoxModel passwordBoxModel4;

  @override
  void initState(BuildContext context) {
    nameBoxModel1 = createModel(context, () => NameBoxModel());
    emailBoxModel1 = createModel(context, () => EmailBoxModel());
    passwordBoxModel1 = createModel(context, () => PasswordBoxModel());
    passwordBoxModel2 = createModel(context, () => PasswordBoxModel());
    nameBoxModel2 = createModel(context, () => NameBoxModel());
    emailBoxModel2 = createModel(context, () => EmailBoxModel());
    passwordBoxModel3 = createModel(context, () => PasswordBoxModel());
    passwordBoxModel4 = createModel(context, () => PasswordBoxModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameBoxModel1.dispose();
    emailBoxModel1.dispose();
    passwordBoxModel1.dispose();
    passwordBoxModel2.dispose();
    nameBoxModel2.dispose();
    emailBoxModel2.dispose();
    passwordBoxModel3.dispose();
    passwordBoxModel4.dispose();
  }
}
