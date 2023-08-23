import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_corp_test_task/core/base_usecase/base_usecase.dart';
import 'package:wiet_corp_test_task/feature/features/cat/domain/entities/cat_entity.dart';

import '../../domain/usecases/get_cats_use_case.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this.d) : super(CatInitial());
  final GetCatsUseCase d;
  List<CatEntity> cats=[];
  void getCats() async {
    emit(GetCatsLoading());
    final res = await d.call(NoParams());
    res.fold(
      (l) => emit(GetCatsError()),
      (r) {
        cats=r;
        emit(GetCatsSucess());
      },
    );
  }
}
