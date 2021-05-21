import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  /// 设置Widget宽高
  Widget size(
      {double? width,
      double? height,
      AlignmentGeometry alignment = Alignment.center}) {
    return Container(
        child: this, width: width, height: height, alignment: alignment);
  }

  /// 设置所有的外边距
  Widget margin(double value) {
    return Container(
      child: this,
      margin: EdgeInsets.all(value),
    );
  }

  /// 设置左外边距
  Widget marginLeft(double value) {
    return Container(
      child: this,
      margin: EdgeInsets.only(left: value),
    );
  }

  /// 设置右外边距
  Widget marginRight(double value) {
    return Container(
      child: this,
      margin: EdgeInsets.only(right: value),
    );
  }

  /// 设置上外边距
  Widget marginTop(double value) {
    return Container(
      child: this,
      margin: EdgeInsets.only(top: value),
    );
  }

  /// 设置下外边距
  Widget marginBottom(double value) {
    return Container(
      child: this,
      margin: EdgeInsets.only(bottom: value),
    );
  }

  /// 设置所有的内边距
  Widget padding(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.all(value),
    );
  }

  /// 设置左内边距
  Widget paddingLeft(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.only(left: value),
    );
  }

  /// 设置右内边距
  Widget paddingRight(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.only(right: value),
    );
  }

  /// 设置上内边距
  Widget paddingTop(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.only(top: value),
    );
  }

  /// 设置下内边距
  Widget paddingBottom(double value) {
    return Container(
      child: this,
      padding: EdgeInsets.only(bottom: value),
    );
  }

  Widget setBackground(
      {double topLeft = 0,
      double bottomLeft = 0,
      double topRight = 0,
      double bottomRight = 0,
      Color borderColor = Colors.white,
      double borderWidth = 0.5,
      Color color = Colors.white}) {
    return Container(
        child: this,
        decoration: new BoxDecoration(
            border: new Border.all(color: borderColor, width: borderWidth),
            color: color,
            borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                bottomLeft: Radius.circular(bottomLeft),
                topRight: Radius.circular(topRight),
                bottomRight: Radius.circular(bottomRight))));
  }


}
