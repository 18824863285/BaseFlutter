import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'base_view_model.dart';

// ignore: must_be_immutable
class BaseChangeNotifierProvider extends ChangeNotifierProvider {

  Key key;
  BaseViewModel viewModel;
  Widget widget;
  BuildContext context;
  Function init;
  BaseChangeNotifierProvider(this.context, {this.key, this.viewModel, this.widget, this.init})
      : super(key: key, create: (BuildContext context) {
          if(init != null){
            init.call();
          }
          return viewModel;
        }, builder: (BuildContext context, Widget child) {
          return widget;
        });
}
