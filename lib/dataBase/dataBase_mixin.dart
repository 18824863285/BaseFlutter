import 'package:wan_android_flutter/dataBase/app_data_base.dart';

import 'database_manger.dart';

class DataBaseMixin {
  AppDatabase _database;

  AppDatabase get database => DatabaseManger.getInstance().database;
}
