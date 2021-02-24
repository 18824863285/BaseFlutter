// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../test/TestModel.dart';
import '../test/TestViewModel.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

extension GetItInjectableX on GetIt {
  GetIt init({
    String environment,
    EnvironmentFilter environmentFilter,
  }) {
    final gh = GetItHelper(this, environment, environmentFilter);
    //final retrofitModule = _$RetrofitModule();
    gh.factory<TestModel>(() => TestModel());
    gh.factory<TestViewModel>(() => TestViewModel());

    // Eager singletons must be registered in the right order
    //gh.singleton<RestClient>(retrofitModule.restClient());
    return this;
  }
}

//class _$RetrofitModule extends RetrofitModule {}
