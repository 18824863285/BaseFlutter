import 'package:injectable/injectable.dart';
import '../base_model.dart';
import 'Test.dart';

@injectable
class TestModel extends BaseModel {
  @factoryMethod
  TestModel();

  void test() {
    Future<Test> future;

    sendRequest(future, <Test>(Test test) {
      print("");
    }, error: (e) {
      print("");
    }, isNeedLoading: false);
  }
}
