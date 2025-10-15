import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/presentation/widgets/promotional_banner_section/widgets/promo_banner_card.dart';

class PromotionalBannerSection extends StatelessWidget {
  const PromotionalBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = PromoBannerModel.banners;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [...banners.map((banner) => PromoBannerCard(banner: banner))],
      ),
    );
  }
}
