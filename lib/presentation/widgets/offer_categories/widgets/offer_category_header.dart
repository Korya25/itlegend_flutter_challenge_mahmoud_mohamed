import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/offer_categories/widgets/offer_see_all_button.dart';

class OfferCategoryHeader extends StatelessWidget {
  const OfferCategoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('أستكشف العروض', style: AppTextStyles.font16PrimaryMeduim()),
          const OfferSeeAllButton(),
        ],
      ),
    );
  }
}
