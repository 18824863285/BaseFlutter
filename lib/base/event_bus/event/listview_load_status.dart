class ListViewLoadStatus {
  static const refresh_succ = 1;
  static const load_more_succ = 2;

  int status;

  ListViewLoadStatus({this.status = refresh_succ});
}
