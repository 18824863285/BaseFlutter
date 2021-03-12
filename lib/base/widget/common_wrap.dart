import 'package:flutter/cupertino.dart';

class CommonWrap<T> extends Wrap {
  final List<T> dataList;
  final Widget Function(T value, int index) itemBuilder;
  final void Function(T value, int index) onItemTap;
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;

  CommonWrap(
    this.dataList,
    this.itemBuilder, {
    Key key,
    this.onItemTap,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.hardEdge,
  }) : super(
            key: key,
            direction: direction,
            alignment: alignment,
            spacing: spacing,
            runAlignment: runAlignment,
            runSpacing: runSpacing,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            clipBehavior: clipBehavior,
            children: getChildList(dataList, itemBuilder, onItemTap));
}

List<Widget> getChildList<T>(
    List<T> dataList,
    Widget Function(T value, int index) itemBuilder,
    void Function(T value, int index) onItemTap) {
  List<Widget> childList = [];
  if (dataList != null && dataList.length > 0) {
    for (int i = 0; i < dataList.length - 1; i++) {
      Widget child = itemBuilder(dataList[i], i);
      if (onItemTap != null) {
        childList.add(GestureDetector(
          child: child,
          onTap: () {
            onItemTap(dataList[i], i);
          },
        ));
      } else {
        childList.add(child);
      }
    }
  }
  return childList;
}
