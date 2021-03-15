import 'app_data_base.dart';

class DatabaseManger {
  static DatabaseManger _instance;
  static const _dbName = "base_flutter_database.db";

  AppDatabase _database;

  // ignore: unnecessary_getters_setters
  AppDatabase get database => _database;

  // ignore: unnecessary_getters_setters
  set database(AppDatabase value) {
    _database = value;
  }

  DatabaseManger._internal();

  factory DatabaseManger.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = DatabaseManger._internal();
    }
    return _instance;
  }

  Future<bool> initDatabase() async {
    database = await $FloorAppDatabase.databaseBuilder(_dbName).build();
    return true;
  }
}
