import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/business/main/main_view_model.dart';

class MainPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends BaseState<MainPage, MainViewModel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: ScreenUtil.getStatusBarHigh()),
          child: Text("ada"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currPageIndex,
          onTap: (index) {
            viewModel.currPageIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: getIcon(Icons.home),
                activeIcon: getActiveIcon(Icons.home),
                title: getBottomText('首页')),
            BottomNavigationBarItem(
                icon: getIcon(Icons.list),
                activeIcon: getActiveIcon(Icons.list),
                title: getBottomText('公众号')),
            BottomNavigationBarItem(
                icon: getIcon(Icons.map),
                activeIcon: getActiveIcon(Icons.map),
                title: getBottomText('知识体系')),
            BottomNavigationBarItem(
                icon: getIcon(Icons.description),
                activeIcon: getActiveIcon(Icons.description),
                title: getBottomText('项目'))
          ],
        ),
      ),
    );
  }

  Icon getIcon(IconData iconData) => Icon(iconData, color: Colors.grey);

  Icon getActiveIcon(IconData iconData) => Icon(iconData, color: Colors.blue);

  Text getBottomText(String text) =>
      Text(text, style: TextStyle(color: Colors.blue));
}
