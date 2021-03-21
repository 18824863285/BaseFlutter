import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/dialog/popupWindow/popup_window.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/business/project/project_view_model.dart';
import 'package:wan_android_flutter/const/resource.dart';

class ProjectPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProjectState();
  }
}

class ProjectState extends BaseState<ProjectPage, ProjectViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        viewModel.getProjectClassification();
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Selector<ProjectViewModel, int>(
            selector: (context, homeViewModel) => viewModel.loadNum,
            builder: (context, count, child) {
              return Column(
                children: [
                  Container(
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
                    padding: EdgeInsets.only(left: 15),
                    height: 45,
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Text(
                            viewModel.getClassificationTitle(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 3),
                            child: Image(
                              image: AssetImage(R
                                  .ASSETS_IMAGES_IC_ARROW_DROP_DOWN_BLACK_24DP_PNG),
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        showWindow(
                          context: context,
                          position: RelativeRect.fromLTRB(
                              0,
                              45 + ScreenUtil.getStatusBarHigh(),
                              260,
                              45 + ScreenUtil.getStatusBarHigh() + 300),
                          duration: 300,
                          windowBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return Container(
                              width: 160,
                              height: 260,
                              color: Colors.blue,
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.blue,
                      width: 260,
                      height: 320,
                      child: PageView.builder(itemBuilder: (context, index) {
                        return Container(
                          width: 260,
                          height: 320,
                        );
                      }),
                    ),
                  ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
