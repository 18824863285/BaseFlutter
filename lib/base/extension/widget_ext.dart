import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  /// 设置Widget宽高
  Container size(
          {double? width,
          double? height,
          AlignmentGeometry alignment = Alignment.center}) =>
      Container(
          child: this, width: width, height: height, alignment: alignment);

  /// 设置所有的外边距
  Container marginAll(double value) => Container(
        child: this,
        margin: EdgeInsets.all(value),
      );

  /// 分别设置所有的外边距
  Container margin(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      Container(
        child: this,
        margin:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      );

  /// 设置左外边距
  Container marginLeft(double value) => Container(
        child: this,
        margin: EdgeInsets.only(left: value),
      );

  /// 设置右外边距
  Container marginRight(double value) => Container(
        child: this,
        margin: EdgeInsets.only(right: value),
      );

  /// 设置上外边距
  Container marginTop(double value) => Container(
        child: this,
        margin: EdgeInsets.only(top: value),
      );

  /// 设置下外边距
  Container marginBottom(double value) => Container(
        child: this,
        margin: EdgeInsets.only(bottom: value),
      );

  /// 设置所有的内边距
  Container paddingAll(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.all(value),
    );
  }

  /// 分别设置所有的内边距
  Container padding(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Container(
      child: this,
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
    );
  }

  /// 设置左内边距
  Container paddingLeft(double value) => Container(
        child: this,
        padding: EdgeInsets.only(left: value),
      );

  /// 设置右内边距
  Container paddingRight(double value) => Container(
        child: this,
        padding: EdgeInsets.only(right: value),
      );

  /// 设置上内边距
  Widget paddingTop(double value) => Container(
        child: this,
        padding: EdgeInsets.only(top: value),
      );

  /// 设置下内边距
  Container paddingBottom(double value) => Container(
        child: this,
        padding: EdgeInsets.only(bottom: value),
      );

  /// 设置圆角背景,通过不同的位置
  Container setBackgroundByDiffPos(
          {double topLeft = 0,
          double bottomLeft = 0,
          double topRight = 0,
          double bottomRight = 0,
          Color borderColor = Colors.white,
          double borderWidth = 0.5,
          AlignmentGeometry? alignment = Alignment.center,
          Color color = Colors.white}) =>
      Container(
          child: this,
          alignment: alignment,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              color: color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft),
                  bottomLeft: Radius.circular(bottomLeft),
                  topRight: Radius.circular(topRight),
                  bottomRight: Radius.circular(bottomRight))));

  /// 设置圆角背景
  Container setBackground(
          {double radius = 0,
          Color borderColor = Colors.white,
          double borderWidth = 0.5,
          AlignmentGeometry? alignment = Alignment.center,
          Color color = Colors.white}) =>
      Container(
          child: this,
          alignment: alignment,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: borderWidth),
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(radius))));

  /// 设置监听点击事件
  GestureDetector onClick(Function() block) =>
      GestureDetector(child: this, onTap: block);

  /// 设置监听双击事件
  GestureDetector onDoubleClick(Function() block) =>
      GestureDetector(child: this, onDoubleTap: block);

  /// 设置控件属性
  /// 包含内边距，外边距，圆角背景，点击世事件
  Widget setAttribute(
      {double marginLeft = 0,
      double marginTop = 0,
      double marginRight = 0,
      double marginBottom = 0,
      double marginAll = 0,
      double paddingLeft = 0,
      double paddingTop = 0,
      double paddingRight = 0,
      double paddingBottom = 0,
      double paddingAll = 0,
      bool isNeedDecoration = false,
      double topLeftRadius = 0,
      double bottomLeftRadius = 0,
      double topRightRadius = 0,
      double bottomRightRadius = 0,
      double allRadius = 0,
      Color borderColor = Colors.white,
      double borderWidth = 0.5,
      Color color = Colors.white,
      AlignmentGeometry alignment = Alignment.center,
      Function()? onClick}) {
    var container = Container(
        child: this,
        alignment: alignment,
        margin: marginAll == 0
            ? EdgeInsets.only(
                left: marginLeft,
                top: marginTop,
                right: marginRight,
                bottom: marginBottom)
            : EdgeInsets.all(marginAll),
        padding: paddingAll == 0
            ? EdgeInsets.only(
                left: paddingLeft,
                top: paddingTop,
                right: paddingRight,
                bottom: paddingBottom)
            : EdgeInsets.all(paddingAll),
        color: isNeedDecoration ? null : color,
        decoration: !isNeedDecoration
            ? null
            : BoxDecoration(
                border: Border.all(color: borderColor, width: borderWidth),
                color: color,
                borderRadius: allRadius != 0
                    ? BorderRadius.all(Radius.circular(allRadius))
                    : BorderRadius.only(
                        topLeft: Radius.circular(topLeftRadius),
                        bottomLeft: Radius.circular(bottomLeftRadius),
                        topRight: Radius.circular(topRightRadius),
                        bottomRight: Radius.circular(bottomRightRadius))));

    if (onClick == null) {
      return container;
    } else {
      return GestureDetector(child: container, onTap: onClick);
    }
  }
}
