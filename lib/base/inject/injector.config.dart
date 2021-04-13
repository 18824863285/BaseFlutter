// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../business/homePage/home_model.dart' as _i3;
import '../../business/homePage/home_view_model.dart' as _i4;
import '../../business/knowledgeHierarchy/knowledge_model.dart' as _i5;
import '../../business/knowledgeHierarchy/knowledge_view_model.dart' as _i6;
import '../../business/login/login_model.dart' as _i7;
import '../../business/login/login_view_model.dart' as _i8;
import '../../business/main/main_model.dart' as _i9;
import '../../business/main/main_view_model.dart' as _i10;
import '../../business/officialAccounts/official_accounts_model.dart' as _i13;
import '../../business/officialAccounts/official_accounts_view_model.dart'
    as _i14;
import '../../business/officialAccounts/officialAccountsArticle/official_accounts_article_model.dart'
    as _i11;
import '../../business/officialAccounts/officialAccountsArticle/official_accounts_article_view_model.dart'
    as _i12;
import '../../business/project/project_model.dart' as _i15;
import '../../business/project/project_view_model.dart' as _i16;
import '../../business/register/register_model.dart' as _i17;
import '../../business/register/register_view_model.dart' as _i18;
import '../../business/search/search_model.dart' as _i20;
import '../../business/search/search_view_model.dart' as _i21;
import '../../business/start/start_model.dart' as _i22;
import '../../business/start/start_view_model.dart' as _i23;
import '../../retrofit/RestClient.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final retrofitModule = _$RetrofitModule();
    gh.factory<_i3.HomeModel>(() => retrofitModule.homeModel());
    gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
    gh.factory<_i5.KnowledgeModel>(() => retrofitModule.knowledgeModel());
    gh.factory<_i6.KnowledgeViewModel>(() => _i6.KnowledgeViewModel());
    gh.factory<_i7.LoginModel>(() => retrofitModule.loginModel());
    gh.factory<_i8.LoginViewModel>(() => _i8.LoginViewModel());
    gh.factory<_i9.MainModel>(() => retrofitModule.mainModel());
    gh.factory<_i10.MainViewModel>(() => _i10.MainViewModel());
    gh.factory<_i11.OfficialAccountsArticleModel>(
        () => retrofitModule.officialAccountsArticleModel());
    gh.factory<_i12.OfficialAccountsArticleViewModel>(
        () => _i12.OfficialAccountsArticleViewModel());
    gh.factory<_i13.OfficialAccountsModel>(
        () => retrofitModule.officialAccountsModel());
    gh.factory<_i14.OfficialAccountsViewModel>(
        () => _i14.OfficialAccountsViewModel());
    gh.factory<_i15.ProjectModel>(() => retrofitModule.projectModel());
    gh.factory<_i16.ProjectViewModel>(() => _i16.ProjectViewModel());
    gh.factory<_i17.RegisterModel>(() => retrofitModule.registerModel());
    gh.factory<_i18.RegisterViewModel>(() => _i18.RegisterViewModel());
    gh.factory<_i19.RestClient>(() => retrofitModule.restClient());
    gh.factory<_i20.SearchModel>(() => retrofitModule.searchModel());
    gh.factory<_i21.SearchViewModel>(() => _i21.SearchViewModel());
    gh.factory<_i22.StartModel>(() => _i22.StartModel());
    gh.factory<_i23.StartViewModel>(() => _i23.StartViewModel());
    return this;
  }
}

class _$RetrofitModule extends _i19.RetrofitModule {}
