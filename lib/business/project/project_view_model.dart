import 'package:injectable/injectable.dart';
import 'package:wan_android_flutter/base/base_view_model.dart';
import 'package:wan_android_flutter/business/project/model/project_classification.dart';
import 'package:wan_android_flutter/business/project/project_model.dart';
import 'model/projects.dart';

@injectable
class ProjectViewModel extends BaseViewModel<ProjectModel> {
  List<ProjectClassificationItem>? projectClassificationList = [];

  List<Datas>? projectList = [];

  int currClassificationIndex = 0;

  @factoryMethod
  ProjectViewModel();

  String? getClassificationTitle() {
    if (projectClassificationList == null ||
        projectClassificationList!.length == 0) {
      return "";
    } else {
      return projectClassificationList![currClassificationIndex].name;
    }
  }

  void getProjectClassification() {
    sendRequest<ProjectClassification>(model.getProjectClassification(),
            (value) {
          projectClassificationList = value.data;
          getProjects(projectClassificationList![currClassificationIndex].id);
        },isNeedLoading: true);
  }

  void getProjects(int? cid) {
    sendRequest<Projects>(model.getProjects(1, cid), (value) {
      if (value.data == null || value.data!.datas == null) {
        projectList = [];
      } else {
        projectList = value.data!.datas;
      }
      notifyPage();
    }, isNeedLoading: true);
  }
}
