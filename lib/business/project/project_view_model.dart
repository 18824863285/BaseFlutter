
import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/project/project_model.dart';

@injectable
class ProjectViewModel extends BaseViewModel<ProjectModel>{
  @factoryMethod
  ProjectViewModel();
}