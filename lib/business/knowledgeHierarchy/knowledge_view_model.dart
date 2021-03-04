
import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_model.dart';

@injectable
class KnowledgeViewModel extends BaseViewModel<KnowledgeModel>{

  @factoryMethod
  KnowledgeViewModel();
}