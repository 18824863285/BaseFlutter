import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/business/knowledgeHierarchy/knowledge_view_model.dart';
import 'package:wan_android_flutter/const/resource.dart';

class KnowledgePage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KnowledgeState();
  }
}

class KnowledgeState extends BaseState<KnowledgePage, KnowledgeViewModel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.black87,
              pinned: true,
              expandedHeight: 250.0,
              leading: SizedBox(
                width: 26,
                height: 26,
                child: Image(
                    fit: BoxFit.fill,
                    width: 26,
                    height: 26,
                    image: AssetImage(
                        R.ASSETS_IMAGES_BASELINE_SEARCH_WHITE_24DP_PNG)),
              ),
              flexibleSpace: const FlexibleSpaceBar(
                title: const Text('知识体系'),
              ),
            ),
            new SliverGrid(
              gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: new Text('list item $index'),
                );
              }, childCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
