import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../database/local_database.dart';
import '../repositories/_repositories_lib.dart';

class AppSettings {
  AppSettings._();

  static final instance = AppSettings._();

  Future<void> initialize() async {
    debugPrint("[${DateTime.now()}] Inicializando App...");

    // Database
    final db = LocalDatabase.instance;
    GetIt.instance.registerSingleton<LocalDatabase>(db);

    // Repositories
    GetIt.instance.registerSingleton<ConfigurationRepository>(
        ConfigurationRepository(db));
  }

  Future<bool> hasInitialConfiguration() async {
    var getIt = GetIt.instance;
    var configRepository = getIt<ConfigurationRepository>();

    var res = await configRepository.getAll();

    return res.isNotEmpty;
  }
}
