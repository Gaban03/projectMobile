part of "_repositories_lib.dart";

class ConfigurationRepository {
  final LocalDatabase _localDatabase;

  ConfigurationRepository(this._localDatabase);

  static String get tableName => "configuration";

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id_config INTEGER PRIMARY KEY,
        data_source TEXT
      );
    ''');
  }

  Future<ConfigurationModel?> getOne(int idConfig) async {
    final db = await _localDatabase.database;

    final maps = await db.query(
      tableName,
      where: 'id_config = ?',
      whereArgs: [idConfig],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return ConfigurationModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<ConfigurationModel>> getAll() async {
    final db = await _localDatabase.database;

    final maps = await db.query(tableName);

    return maps.map((map) => ConfigurationModel.fromMap(map)).toList();
  }

  Future<void> insert(ConfigurationModel model) async {
    final db = await _localDatabase.database;

    await db.insert(
      tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(ConfigurationModel model) async {
    final db = await _localDatabase.database;

    await db.update(
      tableName,
      model.toMap(),
      where: 'id_config = ?',
      whereArgs: [model.idConfig],
    );
  }

  Future<void> delete(int idConfig) async {
    final db = await _localDatabase.database;

    await db.delete(
      tableName,
      where: 'id_config = ?',
      whereArgs: [idConfig],
    );
  }
}
