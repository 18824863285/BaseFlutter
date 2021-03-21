import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_listview_view_model.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_model.dart';

import 'model/knowledge.dart';

@injectable
class KnowledgeViewModel extends BaseListViewViewModel<Data, KnowledgeModel> {
  List<Data> dataList = [];

  @factoryMethod
  KnowledgeViewModel();

  @override
  void getData() {
    sendRequest<Knowledge>(model.getKnowledge(), (value) {
      // controlResult(value.data);
      dataList = value.data;
      notifyPage();
    });
  }
}
