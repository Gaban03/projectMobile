part of "_models_lib.dart";

class ConfigurationModel {
  final int idConfig;
  final String dataSource;

  ConfigurationModel({
    required this.idConfig,
    required this.dataSource,
  });

  ConfigurationModel copyWith({
    int? idConfig,
    String? dataSource,
  }) {
    return ConfigurationModel(
      idConfig: idConfig ?? this.idConfig,
      dataSource: dataSource ?? this.dataSource,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_config': idConfig,
      'data_source': dataSource,
    };
  }

  factory ConfigurationModel.fromMap(Map<String, dynamic> map) {
    return ConfigurationModel(
      idConfig: map['id_config']?.toInt() ?? 0,
      dataSource: map['data_source'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigurationModel.fromJson(String source) =>
      ConfigurationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigurationModel(idConfig: $idConfig, dataSource: $dataSource)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfigurationModel &&
        other.idConfig == idConfig &&
        other.dataSource == dataSource;
  }

  @override
  int get hashCode => idConfig.hashCode ^ dataSource.hashCode;
}
