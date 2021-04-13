import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.config.dart';

const platformMobile = Environment("platformMobile");
const platformWeb = Environment("platformWeb");

//allowReassignment允许一个类被多次注册
GetIt getIt = GetIt.instance..allowReassignment = true;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configInjector({String? env, EnvironmentFilter? environmentFilter}) {
  getIt.init(environmentFilter: environmentFilter);
}

