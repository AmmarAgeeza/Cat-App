import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wiet_corp_test_task/feature/cat/data/datasources/cat_remote_data_source.dart';
import 'package:wiet_corp_test_task/feature/cat/data/repositories/cat_repository.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/repositories/base_repo.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/usecases/get_cats_use_case.dart';

import '../../feature/cat/presentation/cubit/cat_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/app_interceptors.dart';
import '../database/api/dio_consumer.dart';

final sl = GetIt.instance;
void serviceLocatorInit()  {
  //! Blocs
  sl.registerLazySingleton(() => CatCubit(sl()));
 //* use case
  sl.registerLazySingleton(() => GetCatsUseCase(sl()));
  //* repos
  sl.registerLazySingleton<BaseRepository>(() => CatRepository(sl()));
  //* data source
  sl.registerLazySingleton<BaseCatRemoteDataSource>(
      () => CatRemoteDataSource());


  //External
 sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: sl(),));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters(
        client: sl(),
      ));
}
