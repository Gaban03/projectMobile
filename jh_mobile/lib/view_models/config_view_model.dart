part of '_view_models_lib.dart';

class ConfigViewModel {
  final ConfigurationRepository _repository = GetIt.instance<ConfigurationRepository>();

  Future<ConfigurationModel?> getCurrentConfiguration() async {
    return await _repository.getOne(1);
  }

  Future<void> updateConfiguration({required String dataSource}) async {
    final existingConfig = await getCurrentConfiguration();

    final model = ConfigurationModel(
      idConfig: 1,
      dataSource: dataSource,
    );

    if (existingConfig == null) {
      await _repository.insert(model);
    } else {
      await _repository.update(model);
    }
  }

  bool validate(String dataSource) {
    if (dataSource.isEmpty) return false;
    return true;
  }
}
