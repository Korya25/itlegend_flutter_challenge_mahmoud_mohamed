import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/data/models/offer_category_model.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_state.dart';
import 'widgets/offer_category_header.dart';
import 'widgets/offer_category_list.dart';

class OfferCategoriesSection extends StatefulWidget {
  final List<OfferCategoryModel> categories;
  const OfferCategoriesSection({super.key, required this.categories});

  @override
  State<OfferCategoriesSection> createState() => _OfferCategoriesSectionState();
}

class _OfferCategoriesSectionState extends State<OfferCategoriesSection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    if (state is! HomeLoaded) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OfferCategoryHeader(),
        const SizedBox(height: 12),
        OfferCategoryList(
          categories: widget.categories,
          selectedIndex: selectedIndex,
          onSelect: (index) => setState(() => selectedIndex = index),
        ),
      ],
    );
  }
}
