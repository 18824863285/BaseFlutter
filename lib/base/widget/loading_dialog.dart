import 'package:flutter/material.dart';
import 'package:wan_android_flutter/base/util/density_util.dart';

///加载弹窗动画
class LoadingDialog extends StatefulWidget {
  //加载中的文字
  final String loadingText;

  //是否点击控件外部弹窗消失
  final bool outsideDismiss;

  //监听弹窗消失
  final Function dismissListener;

  _LoadingDialogState _state;

  LoadingDialog({Key key, this.loadingText = "loading...", this.outsideDismiss = false, this.dismissListener})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _state = _LoadingDialogState();
  }

  void dismissDialog(){
    _state.dismissDialog();
  }

}

class _LoadingDialogState extends State<LoadingDialog> {
  dismissDialog() {
    Navigator.of(context).pop();
    widget.dismissListener();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.outsideDismiss ? dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () {},
          child: new Center(
            child: new SizedBox(
              width: Density.instance.dp(200),
              height: Density.instance.dp(200),
              child: new Container(
                decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Density.instance.dp(16)),
                    ),
                  ),
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: Density.instance.dp(70),
                      height: Density.instance.dp(70),
                      child: new CircularProgressIndicator(
                        strokeWidth: Density.instance.dp(5),
                        valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 51, 51, 51)),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(
                        top: Density.instance.dp(10),
                      ),
                      child: new Text(
                        widget.loadingText,
                        style: new TextStyle(fontSize: Density.instance.dp(24), color: Color.fromARGB(255, 51, 51, 51)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}