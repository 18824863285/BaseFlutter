import 'package:wan_android_flutter/base/util/density_util.dart';

mixin ScreenAdapterMixin {
  double dp(double screenCopies) {
    return Density.instance!.dp(screenCopies);
  }

  double sp(double spCopies) {
    return Density.instance!.sp(spCopies);
  }
}
