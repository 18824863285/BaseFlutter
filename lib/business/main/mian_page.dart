import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/screen_util.dart';
import 'package:wan_android_flutter/business/homePage/home_page.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_page.dart';
import 'package:wan_android_flutter/business/main/main_view_model.dart';
import 'package:wan_android_flutter/business/officialAccounts/official_accounts_page.dart';
import 'package:wan_android_flutter/business/project/project_page.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

class MainPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends BaseState<MainPage, MainViewModel> {
  List<Widget> _pageList = [
    HomePage(),
    OfficialAccountsPage(),
    KnowledgePage(),
    ProjectPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: viewModel.currPageIndex,
          children: _pageList,
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
                title: getBottomText("首页")), //退出后在进入到这里的时候国际化回报错
            BottomNavigationBarItem(
                icon: getIcon(Icons.list),
                activeIcon: getActiveIcon(Icons.list),
                title: getBottomText("公众号")),
            BottomNavigationBarItem(
                icon: getIcon(Icons.map),
                activeIcon: getActiveIcon(Icons.map),
                title: getBottomText("知识体系")),
            BottomNavigationBarItem(
                icon: getIcon(Icons.description),
                activeIcon: getActiveIcon(Icons.description),
                title: getBottomText("项目"))
          ],
        ),
      ),
    );
  }

  Icon getIcon(IconData iconData) => Icon(iconData, color: Colors.grey);

  Icon getActiveIcon(IconData iconData) =>
      Icon(iconData, color: Color(0xFA000000));

  Text getBottomText(String text) =>
      Text(text, style: TextStyle(color: Color(0xFA000000)));
}
