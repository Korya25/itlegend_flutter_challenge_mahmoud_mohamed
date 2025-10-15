import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/offer_categories/offer_categories_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backPrimary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: OfferCategoriesSection(),
              //
            ),
          ],
        ),
      ),
    );
  }
}
