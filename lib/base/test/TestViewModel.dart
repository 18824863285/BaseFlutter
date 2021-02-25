import 'package:injectable/injectable.dart';
import '../base_view_model.dart';
import 'TestModel.dart';

@injectable
class TestViewModel extends BaseViewModel<TestModel>{

  @factoryMethod
  TestViewModel();

  @override
  void init() {
    model.test();
  }

  void a(){

  }
}