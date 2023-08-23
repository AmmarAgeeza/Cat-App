import 'package:dartz/dartz.dart';
import 'package:wiet_corp_test_task/core/error/failures.dart';
import 'package:wiet_corp_test_task/feature/cat/data/datasources/cat_remote_data_source.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/entities/cat_entity.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/repositories/base_repo.dart';

import '../../../../core/error/exceptions.dart';

class CatRepository extends BaseRepository{
  final BaseCatRemoteDataSource baseCatRemoteDataSource;

  CatRepository(this.baseCatRemoteDataSource);
  @override
  Future<Either<Failure, List<CatEntity>>> getCats() async{
     try {
      final result = await baseCatRemoteDataSource.getCats();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(errorMessageModel: failure.messageModel));
    }
  }
}