import '/flutter_flow/flutter_flow_util.dart';
import 'module_overview_widget.dart' show ModuleOverviewWidget;
import 'package:flutter/material.dart';

class ModuleOverviewModel extends FlutterFlowModel<ModuleOverviewWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
