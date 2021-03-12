import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/base/widget/common_wrap.dart';
import 'package:wan_android_flutter/business/search/model/hot_key.dart';
import 'package:wan_android_flutter/business/search/search_view_model.dart';

class SearchPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends BaseState<SearchPage, SearchViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        viewModel.getHotSearchKey();
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pop();
                        },
                        child: Container(
                          child: Text("取消"),
                          padding: EdgeInsets.only(right: 15),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: SizedBox(
                          height: 40,
                          width: 260,
                          child: TextFormField(
                              textInputAction: TextInputAction.done,
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
                              onFieldSubmitted: (term) {

                              }),
                        ),
                      ))
                    ],
                  ),
                ),
                Expanded(
                    child: Selector<SearchViewModel, int>(
                  selector: (context, searchViewModel) => viewModel.loadNum,
                  builder: (context, count, child) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 10, left: 15),
                              child: Text("热门搜索"),
                            ),
                            Container(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: CommonWrap<HotKeyItem>(
                                  viewModel.hotKeyItems, (hotKeyItem, index) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                          border: new Border.all(
                                              color: Colors.black54,
                                              width: 0.5),
                                          color: Colors.white,
                                          borderRadius:
                                              new BorderRadius.circular((5.0))),
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 5),
                                      child: Text(hotKeyItem.name),
                                      height: 30,
                                      alignment: Alignment.center,
                                    )
                                  ],
                                );
                              },
                                  onItemTap: (hotKeyItem, index) {},
                                  spacing: 5,
                                  runSpacing: 6),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 18, left: 15),
                              child: Text("历史搜索"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
