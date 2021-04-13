import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/dialog/ensure_and_cancel_dialog.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/base/util/time_util.dart';
import 'package:wan_android_flutter/base/webview/webView_page.dart';
import 'package:wan_android_flutter/base/widget/smart_drawer.dart';
import 'package:wan_android_flutter/business/homePage/home_view_model.dart';
import 'package:wan_android_flutter/business/search/search_page.dart';
import 'package:wan_android_flutter/const/resource.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/sharePreference/user_info_share_preference.dart';

class HomePage extends BaseStatefulWidget {
  @override
  State<HomePage> createState() {
    return HomeState();
  }
}

class HomeState extends BaseState<HomePage, HomeViewModel> {
  EnsureAndCancelDialog? ensureAndCancelDialog;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false, //解决键盘导致页面溢出
          drawer: SmartDrawer(
            widthPercent: 0.5,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 160,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          child: ExtendedImage.network(
                            "http://p0.so.qhmsg.com/t016a86d036a514bb77.jpg",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            shape: BoxShape.circle,
                          ),
                          top: 28,
                        ),
                        Positioned(
                          child: Text(
                            UserInfoSp.getInstance().userName,
                            style: TextStyle(color: Colors.white),
                          ),
                          top: 120,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            if (ensureAndCancelDialog == null) {
                              ensureAndCancelDialog = EnsureAndCancelDialog(
                                  "确定要退出登录吗？", onEnsure: () {
                                viewModel!.logout();
                              });
                            }
                            ensureAndCancelDialog!.show(context);
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  R.ASSETS_IMAGES_BASELINE_POWER_SETTINGS_NEW_BLACK_36DP_PNG,
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 5, right: 15),
                                  child: Text("退出登录"),
                                )
                              ],
                            ),
                          ),
                        ),
                        bottom: 0,
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Image.asset(
                              R.ASSETS_IMAGES_IC_VIEW_LIST_BLACK_48DP_PNG,
                              width: 25,
                              height: 25,
                            ),
                          );
                        }),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            push(SearchPage());
                          },
                          child: SizedBox(
                            height: 40,
                            width: 260,
                            child: TextField(
                              enabled: false,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Color(0x30cccccc),
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 5),
                                  filled: true,
                                  hintText: "请输入搜索信息",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Divider(
                  color: Color(0XFFF5F5F5),
                  height: 1,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                  child: Selector<HomeViewModel, int>(
                    selector: (context, homeViewModel) => viewModel!.loadNum,
                    builder: (context, count, child) {
                      return SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        controller: viewModel!.refreshController,
                        onRefresh: () {
                          viewModel!.getBanner();
                          viewModel!.refresh();
                        },
                        onLoading: () {
                          viewModel!.loadMore();
                        },
                        child: CustomScrollView(
                          slivers: <Widget>[
                            // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
                            SliverToBoxAdapter(
                              child: Container(
                                height: 180,
                                color: Colors.green,
                                child: Swiper(
                                  onTap: (int index) {
                                    push(WebViewPage(
                                      viewModel!.bannerItems![index].url,
                                      title: viewModel!.bannerItems![index].title,
                                    ));
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Image.network(
                                      viewModel!.bannerItems![index].imagePath!,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  itemCount: viewModel!.bannerItems?.length ?? 0,
                                  pagination: SwiperPagination(
                                      builder: DotSwiperPaginationBuilder(
                                          color: Colors.white,
                                          activeColor: Colors.black,
                                          size: 6,
                                          activeSize: 6)),
                                  autoplay: true,
                                  duration: 800,
                                ),
                              ),
                            ),
                            // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
                            SliverFixedExtentList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      push(WebViewPage(
                                        viewModel!.dataList[index].link,
                                        title: viewModel!.dataList[index].title,
                                      ));
                                    },
                                    child: Container(
                                      height: 100, //高度要加上，不然会卡死
                                      margin: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 5,
                                          bottom: 5),
                                      decoration: new BoxDecoration(
                                          border: new Border.all(
                                              color: Color(0xFA000000),
                                              width: 0.5),
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular((5.0))),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              child: Text(
                                                  viewModel!
                                                          .getData(index)
                                                          ?.title ??
                                                      "",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              constraints:
                                                  BoxConstraints(maxWidth: 280),
                                            ),
                                            left: 15,
                                            top: 10,
                                          ),
                                          Positioned(
                                            child: Text(
                                              '作者：${viewModel!.getData(index)?.author ?? ""}',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            left: 15,
                                            top: 30,
                                          ),
                                          Positioned(
                                            child: Text(
                                              '时间：${TimeUtil.getStandardTime(viewModel!.getData(index)?.publishTime ?? 0)}',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            left: 15,
                                            top: 60,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }, childCount: viewModel!.dataList.length),
                                itemExtent: 100)
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
