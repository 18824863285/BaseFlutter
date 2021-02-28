// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../business/login/login_model.dart' as _i3;
import '../../business/login/login_view_model.dart' as _i4;
import '../../business/start/start_model.dart' as _i6;
import '../../business/start/start_view_model.dart' as _i7;
import '../../retrofit/RestClient.dart' as _i5;
import '../test/TestModel.dart' as _i8;
import '../test/TestViewModel.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init(
      {String environment, _i2.EnvironmentFilter environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final retrofitModule = _$RetrofitModule();
    gh.factory<_i3.LoginModel>(() => retrofitModule.loginModel());
    gh.factory<_i4.LoginViewModel>(() => _i4.LoginViewModel());
    gh.factory<_i5.RestClient>(() => retrofitModule.restClient());
    gh.factory<_i6.StartModel>(() => _i6.StartModel());
    gh.factory<_i7.StartViewModel>(() => _i7.StartViewModel());
    gh.factory<_i8.TestModel>(() => _i8.TestModel());
    gh.factory<_i9.TestViewModel>(() => _i9.TestViewModel());
    return this;
  }
}

class _$RetrofitModule extends _i5.RetrofitModule {}
