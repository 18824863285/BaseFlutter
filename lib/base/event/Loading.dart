class Loading {
  // ignore: non_constant_identifier_names
  static const SHOW_LOADING = 1;
  static const DISMISS_LOADING = 2;

  int status;
  bool outsideDismiss;

  Loading({this.status = SHOW_LOADING, this.outsideDismiss = false});
}
