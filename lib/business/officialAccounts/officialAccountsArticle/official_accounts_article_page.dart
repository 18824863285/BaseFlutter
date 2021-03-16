import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/base/base_listview_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/officialAccounts/model/official_account.dart';
import 'package:wan_android_flutter/business/officialAccounts/officialAccountsArticle/official_accounts_article_view_model.dart';

class OfficialAccountsArticlePage extends BaseStatefulWidget {
  final OfficialAccountItem officialAccount;

  OfficialAccountsArticlePage(this.officialAccount);

  @override
  State<StatefulWidget> createState() {
    return OfficialAccountsArticleState();
  }
}

class OfficialAccountsArticleState extends BaseListViewState<
    OfficialAccountsArticlePage, OfficialAccountsArticleViewModel> {
  var controller = new ScrollController();

  @override
  bool isInitialRefresh() => true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider(
      create: (_) {
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          color: Colors.white,
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: refreshController,
            onRefresh: refresh,
            onLoading: loadMore,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
                controller: controller,
                itemCount: viewModel.dataList?.length ?? 0),
          ),
        ),
      ),
    );
  }
}
