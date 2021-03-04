

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/project/project_view_model.dart';

class ProjectPage extends BaseStatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return ProjectState();
  }
  
}

class ProjectState extends BaseState<ProjectPage, ProjectViewModel>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }

}