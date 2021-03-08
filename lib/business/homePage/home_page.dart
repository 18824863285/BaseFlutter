import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/business/homePage/home_view_model.dart';
import 'package:wan_android_flutter/const/resource.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends BaseStatefulWidget {
  @override
  State<HomePage> createState() {
    return HomeState();
  }
}

class HomeState extends BaseState<HomePage, HomeViewModel> {
  var refreshController = RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return viewModel;
      },
      child: MaterialApp(
        home: Scaffold(
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
                        child: Image.asset(
                          R.ASSETS_IMAGES_IC_VIEW_LIST_BLACK_48DP_PNG,
                          width: 25,
                          height: 25,
                        ),
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
                      if (!viewModel.isRequest) {
                        refreshController.refreshCompleted();
                      }
                      return SmartRefresher(
                        controller: refreshController,
                        onRefresh: () {
                          viewModel.refresh();
                        },
                        onLoading: () {
                          viewModel.loadMore();
                        },
                        child: ListView.builder(itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 5, bottom: 5),
                            decoration: new BoxDecoration(
                                border: new Border.all(
                                    color: Color(0xFA000000), width: 0.5),
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular((5.0))),
                            height: 80, //高度要加上，不然会卡死
                            child: Stack(),
                          );
                        }),
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
