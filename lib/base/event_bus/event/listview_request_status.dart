class ListViewRequestStatus {
  static const load_finish = 1;
  static const load_error = 2;

  int status;

  ListViewRequestStatus({this.status = load_finish});
}
