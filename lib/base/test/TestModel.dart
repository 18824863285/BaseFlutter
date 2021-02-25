import 'package:injectable/injectable.dart';
import '../base_model.dart';
import 'Test.dart';

@injectable
class TestModel extends BaseModel {
  @factoryMethod
  TestModel();

  void test() {
    Future<Test> future;

    sendRequest(future, (Test test) {
      print("");
    });

    sendRequest<Test>(future, (value) {
      value.a;
    });
  }
}
