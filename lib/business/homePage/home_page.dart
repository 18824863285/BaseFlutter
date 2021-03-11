import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/dialog/ensure_and_cancel_dialog.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/base/util/time_util.dart';
import 'package:wan_android_flutter/base/widget/smart_drawer.dart';
import 'package:wan_android_flutter/business/homePage/home_view_model.dart';
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
  EnsureAndCancelDialog ensureAndCancelDialog;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: SmartDrawer(
            widthPercent: 0.5,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    height: 160,
                    color: Colors.blue,
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
                                viewModel.logout();
                              });
                            }
                            ensureAndCancelDialog.show(context);
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
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Color(0x30cccccc),
                                contentPadding: EdgeInsets.only(left: 15),
                                filled: true,
                                hintText: "请输入搜索信息",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
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
                    selector: (context, homeViewModel) => viewModel.loadNum,
                    builder: (context, count, child) {
                      return SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        controller: viewModel.refreshController,
                        onRefresh: () {
                          viewModel.refresh();
                        },
                        onLoading: () {
                          viewModel.loadMore();
                        },
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100, //高度要加上，不然会卡死
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 5, bottom: 5),
                                decoration: new BoxDecoration(
                                    border: new Border.all(
                                        color: Color(0xFA000000), width: 0.5),
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular((5.0))),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        child: Text(
                                            viewModel.getData(index)?.title ??
                                                "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        constraints:
                                            BoxConstraints(maxWidth: 280),
                                      ),
                                      left: 15,
                                      top: 10,
                                    ),
                                    Positioned(
                                      child: Text(
                                        '作者：${viewModel.getData(index)?.author ?? ""}',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      left: 15,
                                      top: 30,
                                    ),
                                    Positioned(
                                      child: Text(
                                        '时间：${TimeUtil.getStandardTime(viewModel.getData(index)?.publishTime ?? 0)}',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      left: 15,
                                      top: 60,
                                    )
                                  ],
                                ),
                              );
                            },
                            itemExtent: 100,
                            itemCount: viewModel.dataList.length),
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
