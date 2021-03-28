import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_view_model.dart';

// ignore: must_be_immutable
class BaseChangeNotifierProvider<VM extends BaseViewModel>
    extends ChangeNotifierProvider {
  Key key;
  VM viewModel;
  Widget widget;
  Function init;

  BaseChangeNotifierProvider({this.key, this.viewModel, this.widget, this.init})
      : super(
            key: key,
            create: (BuildContext context) {
              if (init != null) {
                init.call();
              }
              return viewModel;
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Selector<VM, int>(
                    selector: (context, homeViewModel) => viewModel.loadNum,
                    builder: (context, count, child) {
                      return widget;
                    }),
              ),
            ));
}
