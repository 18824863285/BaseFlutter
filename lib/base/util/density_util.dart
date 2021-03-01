import 'package:flutter/material.dart';

///屏幕适配
///单例模式
///使用方式:
///1、在程序启动后第一个 state 中初始化
///   Density.instance.init(context, 750, 750);
///2、控件中使用：Density.instance.dp(375)
///3、文本中使用：Density.instance.sp(37.5)
class Density {
  static Density _instance;

  static Density get instance => _getInstance();

  factory Density() => _getInstance();

  static Density _getInstance() {
    if (_instance == null) {
      _instance = Density._internal();
    }
    return _instance;
  }

  Density._internal();

  MediaQueryData _mediaQuery;

  //屏幕宽度值，如 UI 设计稿件是按 750px 设计的，则在 init 函数中传入 750
  double _screenCopies;

  //屏幕宽度和字体大小的比值，字体大小等于 屏幕宽度/该值
  double _spCopies;

  //初始化，在程序启动后第一个 state 中进行设置
  //如果 screenCopies、spCopies传入为 null 则获取的 dp sp 为系统默认的
  void init(BuildContext context, double screenCopies, double spCopies) {
    _mediaQuery = MediaQuery.of(context);
    _screenCopies = screenCopies != null && screenCopies > 0 ? screenCopies : screenWidth;
    _spCopies = spCopies != null && spCopies > 0 ? spCopies : screenWidth;
  }

  double dp(double screenCopies) {
    return (screenWidth * screenCopies) / _screenCopies;
  }

  double sp(double spCopies) {
    return (screenWidth * spCopies) / _spCopies;
  }

  //屏幕宽度
  double get screenWidth => _mediaQuery.size.width;

  //屏幕高度
  double get screenHeight => _mediaQuery.size.height;

  //状态栏高度
  double get statusBarHeight => _mediaQuery.padding.top;

  //底部导航栏高度
  double get bottomBarHeight => _mediaQuery.padding.bottom;
}