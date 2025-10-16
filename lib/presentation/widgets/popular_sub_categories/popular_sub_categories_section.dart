import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/data/models/sub_category_model.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_state.dart';
import 'widgets/sub_category_card.dart';

class PopularSubCategoriesSection extends StatelessWidget {
  final List<SubCategoryModel> subCategories;
  const PopularSubCategoriesSection({super.key, required this.subCategories});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    if (state is! HomeLoaded) {
      return const SizedBox();
    }

    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: subCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final subCategory = subCategories[index];
          return SubCategoryCard(subCategory: subCategory);
        },
      ),
    );
  }
}
