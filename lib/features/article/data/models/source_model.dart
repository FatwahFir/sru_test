import 'package:sru_test/features/article/domain/entities/source.dart';

class SourceModel extends Source {
  const SourceModel({required super.id, required super.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
