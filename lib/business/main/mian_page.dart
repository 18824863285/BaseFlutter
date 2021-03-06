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
  HomePage _homePage;
  OfficialAccountsPage _officialAccountsPage;
  KnowledgePage _knowledgePage;
  ProjectPage _projectPage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: getPage(viewModel.currPageIndex),
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
                title: getBottomText(S.of(context).home_page)),
            BottomNavigationBarItem(
                icon: getIcon(Icons.list),
                activeIcon: getActiveIcon(Icons.list),
                title: getBottomText(S.of(context).officialAccounts)),
            BottomNavigationBarItem(
                icon: getIcon(Icons.map),
                activeIcon: getActiveIcon(Icons.map),
                title: getBottomText(S.of(context).knowledgeHierarchy)),
            BottomNavigationBarItem(
                icon: getIcon(Icons.description),
                activeIcon: getActiveIcon(Icons.description),
                title: getBottomText(S.of(context).project))
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  BaseStatefulWidget getPage(int currIndex) {
    switch (currIndex) {
      case 0:
        if (_homePage == null) {
          _homePage = HomePage();
        }
        return _homePage;
        break;
      case 1:
        if (_officialAccountsPage == null) {
          _officialAccountsPage = OfficialAccountsPage();
        }
        return _officialAccountsPage;
        break;
      case 2:
        if (_knowledgePage == null) {
          _knowledgePage = KnowledgePage();
        }
        return _knowledgePage;
        break;
      case 3:
        if (_projectPage == null) {
          _projectPage = ProjectPage();
        }
        return _projectPage;
        break;
      default:
        break;
    }
  }

  Icon getIcon(IconData iconData) => Icon(iconData, color: Colors.grey);

  Icon getActiveIcon(IconData iconData) => Icon(iconData, color: Color(0xFA000000));

  Text getBottomText(String text) =>
      Text(text, style: TextStyle(color:  Color(0xFA000000)));
}
