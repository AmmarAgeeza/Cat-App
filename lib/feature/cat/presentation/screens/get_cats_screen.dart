import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wiet_corp_test_task/core/utils/app_colors.dart';

import '../components/app_bar_component.dart';
import '../components/image_component.dart';
import '../cubit/cat_cubit.dart';
import '../cubit/cat_state.dart';

class GetCatsScreen extends StatelessWidget {
  const GetCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: appBarComponent(),
        body: BlocBuilder<CatCubit, CatState>(builder: (context, state) {
          return TabBarView(
            children: [
              state is GetCatsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const CatTab(),
            ],
          );
        }),
      ),
    );
  }
}

class CatTab extends StatelessWidget {
  const CatTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          axisDirection: AxisDirection.down,
          children: List.generate(
            BlocProvider.of<CatCubit>(context).cats.length,
            (index) => ImageComponent(
              cat: BlocProvider.of<CatCubit>(context).cats[index],
            ),
          ),
        ),
      ),
    );
  }
}
