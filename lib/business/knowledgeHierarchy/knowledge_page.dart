

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_view_model.dart';

class KnowledgePage extends BaseStatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return KnowledgeState();
  }

}

class KnowledgeState extends BaseState<KnowledgePage, KnowledgeViewModel>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }

}