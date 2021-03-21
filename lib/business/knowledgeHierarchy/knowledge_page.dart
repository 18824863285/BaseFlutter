import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android_flutter/base/base_listview_state.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/widget/common_wrap.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_view_model.dart';
import 'package:wan_android_flutter/business/search/search_page.dart';
import 'package:wan_android_flutter/const/resource.dart';

import 'model/knowledge.dart';

class KnowledgePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KnowledgeState();
  }
}

class KnowledgeState
    extends BaseListViewState<KnowledgePage, KnowledgeViewModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        viewModel.getData();
        return viewModel;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Selector<KnowledgeViewModel, int>(
          selector: (context, knowledgeViewModel) => viewModel.loadNum,
          builder: (context, value, child) {
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.black87,
                    pinned: true,
                    expandedHeight: 200.0,
                    leading: GestureDetector(
                      onTap: () {
                        push(SearchPage());
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(R
                                .ASSETS_IMAGES_BASELINE_SEARCH_WHITE_24DP_PNG)),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('知识体系'),
                      background: Image.network(
                        'http://5b0988e595225.cdn.sohucs.com/images/20171205/d7432f581303481eb92c3f06433b5014.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: new SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return new Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 10,right: 10,top: 2.5,bottom: 2.5),
                        padding: EdgeInsets.all(5),
                        decoration: new BoxDecoration(
                            border: new Border.all(
                                color: Color(0xFA000000), width: 0.5),
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular((5.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(viewModel.dataList[index].name),
                              margin: EdgeInsets.only(bottom: 5),
                            ),
                            CommonWrap<Children>(
                                viewModel.dataList[index].children,
                                    (value, index) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: new BoxDecoration(
                                            border: new Border.all(
                                                color: Colors.black54, width: 0.5),
                                            color: Colors.white,
                                            borderRadius:
                                            new BorderRadius.circular((5.0))),
                                        padding: EdgeInsets.only(
                                            left: 5, right: 5, top: 5, bottom: 5),
                                        child: Text(value.name),
                                        height: 30,
                                        alignment: Alignment.center,
                                      )
                                    ],
                                  );
                                }, spacing: 5, runSpacing: 6)
                          ],
                        ),
                      );
                    }, childCount: viewModel.dataList?.length ?? 0),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
