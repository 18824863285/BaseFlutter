import 'package:floor/floor.dart';

@entity
class HistorySearchKey {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? title;

 // HistorySearchKey(this.title);

  HistorySearchKey(this.id, this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HistorySearchKey &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

}
