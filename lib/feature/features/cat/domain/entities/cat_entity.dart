import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String id;
  final String url;
  final int width;
  final int height;

  const CatEntity({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        width,
        height,
      ];
}
