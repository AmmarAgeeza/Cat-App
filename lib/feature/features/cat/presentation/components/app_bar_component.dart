import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_corp_test_task/core/utils/app_strings.dart';

import '../cubit/cat_cubit.dart';
import '../cubit/cat_state.dart';

AppBar appBarComponent() {
  return AppBar(
    title: const Text(AppStrings.appName),
    actions: [
      BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              BlocProvider.of<CatCubit>(context).getCats();
            },
            icon: const Icon(Icons.refresh),
          );
        },
      ),
    ],
    bottom: const TabBar(
      tabs: [
        Tab(text: AppStrings.cats),
      ],
    ),
  );
}
