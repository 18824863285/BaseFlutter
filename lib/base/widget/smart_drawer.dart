import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartDrawer extends StatefulWidget {
  final double elevation;
  final Widget? child;
  final String? semanticLabel;
  final double widthPercent;
  ///add start
  final DrawerCallback? callback;
  ///add end
  const SmartDrawer({
    Key? key,
    this.elevation = 16.0,
    this.child,
    this.semanticLabel,
    required this.widthPercent,
    ///add start
    this.callback,
    ///add end
  })  : assert(widthPercent < 1.0 && widthPercent > 0.0),
        super(key: key);
  @override
  _SmartDrawerState createState() => _SmartDrawerState();
}

class _SmartDrawerState extends State<SmartDrawer> {

  @override
  void initState() {
    ///add start
    if(widget.callback!=null){
      widget.callback!(true);
    }
    ///add end
    super.initState();
  }
  @override
  void dispose() {
    ///add start
    if(widget.callback!=null){
      widget.callback!(false);
    }
    ///add end
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = widget.semanticLabel;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        label = widget.semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = widget.semanticLabel ?? MaterialLocalizations.of(context).drawerLabel;
    }
    final double _width = MediaQuery.of(context).size.width * widget.widthPercent;
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      explicitChildNodes: true,
      label: label,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: _width),
        child: Material(
          elevation: widget.elevation,
          child: widget.child,
        ),
      ),
    );
  }
}