import 'package:wiet_corp_test_task/core/database/api/api_consumer.dart';
import 'package:wiet_corp_test_task/core/database/api/end_points.dart';
import 'package:wiet_corp_test_task/core/services/service_locator.dart';
import 'package:wiet_corp_test_task/feature/features/cat/data/models/cat_model.dart';


abstract class BaseCatRemoteDataSource {
  Future<List<CatModel>> getCats();
}

class CatRemoteDataSource extends BaseCatRemoteDataSource {
  @override
  Future<List<CatModel>> getCats() async {
    final response = await sl<ApiConsumer>().get(
      EndPoints.images,
      queryParameters: {
        "limit": '80',
        "order": 'Random',
        "size": 'small',
        "page": '3',
        "sub_id": 'demo-ce06ee,'
      },
    );
    return response.map<CatModel>((e)=>CatModel.fromJson(e)).toList();
  }
}
