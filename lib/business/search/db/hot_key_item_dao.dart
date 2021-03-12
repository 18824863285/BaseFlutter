import 'package:floor/floor.dart';
import 'package:wan_android_flutter/business/search/model/hot_key.dart';

@dao
abstract class HotKeyItemDao {
  @Query('SELECT * FROM HotKeyItem')
  Future<List<HotKeyItem>> findAllHotKeyItems();

  @insert
  Future<void> insertHotKeyItem(HotKeyItem hotKeyItem);

  @insert
  Future<void> insertHotKeyItemList(List<HotKeyItem> hotKeyItems);
}
