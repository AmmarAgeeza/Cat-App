import 'package:dartz/dartz.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/entities/cat_entity.dart';

import '../../../../core/error/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<CatEntity>>> getCats();
}
