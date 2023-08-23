import 'package:wiet_corp_test_task/core/database/api/end_points.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/entities/cat_entity.dart';

class CatModel extends CatEntity {
  const CatModel({
    required super.id,
    required super.url,
    required super.width,
    required super.height,
  });
  factory CatModel.fromJson(Map<String, dynamic> jsonData) {
    return CatModel(
      id: jsonData[ApiKeys.id],
      url: jsonData[ApiKeys.url],
      width: jsonData[ApiKeys.width],
      height: jsonData[ApiKeys.height],
    );
  }
}
