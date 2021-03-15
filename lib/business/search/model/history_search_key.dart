import 'package:floor/floor.dart';

@entity
class HistorySearchKey {
  @PrimaryKey(autoGenerate: true)
  int id;
  String title;

  HistorySearchKey(this.title);
}
