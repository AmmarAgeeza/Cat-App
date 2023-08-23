
import 'package:equatable/equatable.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}
class GetCatsLoading extends CatState {}
class GetCatsSucess extends CatState {}
class GetCatsError extends CatState {}
