import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/base/webview/webView_page.dart';
import 'package:wan_android_flutter/business/officialAccounts/officialAccountsArticle/official_accounts_article_page.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_view_model.dart';

class OfficialAccountsPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OfficialAccountsState();
  }
}

class OfficialAccountsState
    extends BaseState<OfficialAccountsPage, OfficialAccountsViewModel>
    with TickerProviderStateMixin {
  var _tabController;

  @override
  void initState() {
    super.initState();
    _initTabControl(0);
  }

  void _initTabControl(int length) {
    _tabController =
        TabController(initialIndex: 0, length: length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) {
          viewModel.getOfficialAccounts((length) {
            _initTabControl(length);
          });
          return viewModel;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
              alignment: Alignment.center,
              child: DefaultTabController(
                length: viewModel.officialAccounts?.length ?? 0,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      child: Selector<OfficialAccountsViewModel, int>(
                          builder: (context, count, child) {
                            return getTab();
                          },
                          selector: (context, searchViewModel) =>
                              viewModel.loadNum),
                    ),
                    Expanded(
                      child: Selector<OfficialAccountsViewModel, int>(
                          builder: (context, count, child) {
                            return getTabView();
                          },
                          selector: (context, searchViewModel) =>
                              viewModel.loadNum),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget getTab() {
    if (viewModel.officialAccounts == null ||
        viewModel.officialAccounts.length == 0) {
      return Container();
    } else {
      return TabBar(
        indicatorColor: Colors.black87,
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true,
        tabs: viewModel.officialAccounts?.map((item) {
          return Tab(
            child: Text(
              item.name,
              style: TextStyle(color: Colors.black87),
            ),
          );
        })?.toList(),
      );
    }
  }

  Widget getTabView() {
    if (viewModel.officialAccounts == null ||
        viewModel.officialAccounts.length == 0) {
      return Container();
    } else {
      return TabBarView(
        controller: _tabController,
        children: viewModel.officialAccounts?.map((item) {
          return Container(
            alignment: Alignment.center,
            child: OfficialAccountsArticlePage(item, context),
          );
        })?.toList(),
      );
    }
  }
}
