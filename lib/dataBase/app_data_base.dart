
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:wan_android_flutter/business/search/db/history_search_key_dao.dart';
import 'package:wan_android_flutter/business/search/model/history_search_key.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_data_base.g.dart';

@Database(version: 1, entities: [HistorySearchKey])
abstract class AppDatabase extends FloorDatabase {
  HistorySearchKeyDao get historySearchKeyDao;
}

