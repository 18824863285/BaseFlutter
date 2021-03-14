import 'package:flutter/cupertino.dart';

abstract class DialogInterface {
  Widget getChild();

  bool isOutsideDismiss();
}
