import '/components/lessons_list_view/lessons_list_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for LessonsListView component.
  late LessonsListViewModel lessonsListViewModel1;
  // Model for LessonsListView component.
  late LessonsListViewModel lessonsListViewModel2;

  @override
  void initState(BuildContext context) {
    lessonsListViewModel1 = createModel(context, () => LessonsListViewModel());
    lessonsListViewModel2 = createModel(context, () => LessonsListViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    lessonsListViewModel1.dispose();
    lessonsListViewModel2.dispose();
  }
}
