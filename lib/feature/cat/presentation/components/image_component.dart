import 'package:flutter/material.dart';
import 'package:wiet_corp_test_task/feature/cat/domain/entities/cat_entity.dart';

import '../widgets/default_cached_network_image.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    required this.cat,
  });
  final CatEntity cat;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: cat.id,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: DefaultCachedNetworkImage(
          // height: cat.height.toDouble(),
          // width: cat.width.toDouble(),
          imageUrl: cat.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
