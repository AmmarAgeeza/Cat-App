import 'package:flutter/material.dart';
import 'package:wiet_corp_test_task/core/utils/app_colors.dart';
import 'package:wiet_corp_test_task/feature/features/cat/domain/entities/cat_entity.dart';

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
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          child: DefaultCachedNetworkImage(
            imageUrl: cat.url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
