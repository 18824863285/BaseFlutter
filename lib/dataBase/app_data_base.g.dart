// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_base.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HistorySearchKeyDao _historySearchKeyDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `HistorySearchKey` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HistorySearchKeyDao get historySearchKeyDao {
    return _historySearchKeyDaoInstance ??=
        _$HistorySearchKeyDao(database, changeListener);
  }
}

class _$HistorySearchKeyDao extends HistorySearchKeyDao {
  _$HistorySearchKeyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _historySearchKeyInsertionAdapter = InsertionAdapter(
            database,
            'HistorySearchKey',
            (HistorySearchKey item) =>
                <String, dynamic>{'id': item.id, 'title': item.title});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HistorySearchKey> _historySearchKeyInsertionAdapter;

  @override
  Future<List<HistorySearchKey>> findHistorySearchKeys() async {
    return _queryAdapter.queryList('SELECT * FROM HistorySearchKey',
        mapper: (Map<String, dynamic> row) =>
            HistorySearchKey(row['title'] as String));
  }

  @override
  Future<int> insertHotKeyItem(HistorySearchKey hotKeyItem) {
    return _historySearchKeyInsertionAdapter.insertAndReturnId(
        hotKeyItem, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertHotKeyItemList(List<HistorySearchKey> hotKeyItems) async {
    await _historySearchKeyInsertionAdapter.insertList(
        hotKeyItems, OnConflictStrategy.abort);
  }
}
