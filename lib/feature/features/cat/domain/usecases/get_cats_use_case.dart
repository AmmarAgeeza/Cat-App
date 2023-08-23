import 'package:dartz/dartz.dart';
import 'package:wiet_corp_test_task/core/base_usecase/base_usecase.dart';
import 'package:wiet_corp_test_task/core/error/failures.dart';
import 'package:wiet_corp_test_task/feature/features/cat/domain/entities/cat_entity.dart';
import 'package:wiet_corp_test_task/feature/features/cat/domain/repositories/base_repo.dart';

class GetCatsUseCase extends BaseUseCase<List<CatEntity>,NoParams>{
  final BaseRepository repository;

  GetCatsUseCase(this.repository);
  @override
  Future<Either<Failure, List<CatEntity>>> call(NoParams params)async {
return await repository.getCats();
  }
}