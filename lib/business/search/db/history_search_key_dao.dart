import 'package:floor/floor.dart';
import 'package:wan_android_flutter/business/search/model/history_search_key.dart';

@dao
abstract class HistorySearchKeyDao {
  @Query('SELECT * FROM HistorySearchKey')
  Future<List<HistorySearchKey>> findHistorySearchKeys();

  @insert
  Future<int> insertHotKeyItem(HistorySearchKey hotKeyItem);

  @insert
  Future<void> insertHotKeyItemList(List<HistorySearchKey> hotKeyItems);

  @delete
  Future<int> deleteHistorySearchKey(HistorySearchKey historySearchKey);

  @delete
  Future<int> deleteHistorySearchKeys(List<HistorySearchKey> historySearchKeys);
}
