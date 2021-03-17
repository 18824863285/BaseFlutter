import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/base/base_listview_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/time_util.dart';
import 'package:wan_android_flutter/base/webview/webView_page.dart';
import 'package:wan_android_flutter/business/officialAccounts/model/official_account.dart';
import 'package:wan_android_flutter/business/officialAccounts/officialAccountsArticle/official_accounts_article_view_model.dart';

/// 公众号文章列表
class OfficialAccountsArticlePage extends BaseStatefulWidget {
  final OfficialAccountItem officialAccount;
  final BuildContext parentContext;

  OfficialAccountsArticlePage(this.officialAccount, this.parentContext);

  @override
  State<StatefulWidget> createState() {
    return OfficialAccountsArticleState();
  }
}

class OfficialAccountsArticleState extends BaseListViewState<
    OfficialAccountsArticlePage,
    OfficialAccountsArticleViewModel> with AutomaticKeepAliveClientMixin {
  var controller = new ScrollController();

  @override
  bool isInitialRefresh() => true;

  @override
  void initState() {
    super.initState();
    setContext(widget
        .parentContext); // 使用父page的context，解决首页跳转子页面依然显示BottomNavigationBar的问题
    viewModel.officialAccount = widget.officialAccount;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) {
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Selector<OfficialAccountsArticleViewModel, int>(
            selector: (context, officialAccountsArticleViewModel) =>
                viewModel.loadNum,
            builder: (context, value, child) {
              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: refreshController,
                onRefresh: refresh,
                onLoading: loadMore,
                child: ListView.builder(
                    //child直接放ListView，不然可能会导致下拉刷新和分页加载失败
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          height: 100,
                          child: Container(
                            height: 100, //高度要加上，不然会卡死
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: new BoxDecoration(
                                border: new Border.all(
                                    color: Color(0xFA000000), width: 0.5),
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular((5.0))),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    child: Text(
                                        viewModel.getItemData(index)?.title ??
                                            "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    constraints: BoxConstraints(maxWidth: 280),
                                  ),
                                  left: 15,
                                  top: 10,
                                ),
                                Positioned(
                                  child: Text(
                                    '作者：${viewModel.getItemData(index)?.author ?? ""}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  left: 15,
                                  top: 30,
                                ),
                                Positioned(
                                  child: Text(
                                    '时间：${TimeUtil.getStandardTime(viewModel.getItemData(index)?.publishTime ?? 0)}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  left: 15,
                                  top: 60,
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          push(WebViewPage(
                            viewModel.dataList[index].link,
                            title: viewModel.dataList[index].title,
                          ));
                        },
                      );
                    },
                    itemExtent: 100,
                    itemCount: viewModel.dataList?.length ?? 0),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
