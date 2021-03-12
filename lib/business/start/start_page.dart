import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/base/base_change_notifier_provider.dart';
import 'package:wan_android_flutter/base/base_state.dart';
import 'package:wan_android_flutter/base/base_stateful_widget.dart';
import 'package:wan_android_flutter/base/util/density_util.dart';
import 'package:wan_android_flutter/business/login/login_page.dart';
import 'package:wan_android_flutter/business/start/start_view_model.dart';
import 'package:wan_android_flutter/generated/l10n.dart';

class StartPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends BaseState<StartPage, StartViewModel> {
  @override
  Widget build(BuildContext context) {
    Density.instance.init(context, 780, null);
    return ChangeNotifierProvider(
        create: (_) {
          print("====>StartState--ChangeNotifierProvider");
          viewModel.startCountdown(5);
          return viewModel;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Stack(
              children: [
                ConstrainedBox(
                  //填充父类
                  child: Image.network(
                    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=851178854,1709478981&fm=26&gp=0.jpg",
                    fit: BoxFit.cover,
                  ),
                  constraints: BoxConstraints.expand(),
                ),
                Positioned(
                    right: 10,
                    top: 30,
                    child: Text(
                  S.of(context).name,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      viewModel.cancelCountdown();
                      viewModel.toNextPage();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Selector<StartViewModel, int>(
                          selector: (context, startViewModel) =>
                              startViewModel.currTime,
                          builder: (context, count, child) {
                            return Text(
                              "剩余${viewModel.currTime}s",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            );
                          },
                        )),
                  ),
                  right: 10,
                  top: 30,
                )],
            ),
          ),
        ));
  }
}
