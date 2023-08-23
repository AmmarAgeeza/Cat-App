import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiet_corp_test_task/core/utils/app_strings.dart';
import 'package:wiet_corp_test_task/feature/features/cat/presentation/screens/get_cats_screen.dart';

import '../core/services/service_locator.dart';
import '../feature/features/cat/presentation/cubit/cat_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => sl<CatCubit>()..getCats(),
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        title:AppStrings.appName ,
        home: GetCatsScreen(),
      ),
    );
  }
}
