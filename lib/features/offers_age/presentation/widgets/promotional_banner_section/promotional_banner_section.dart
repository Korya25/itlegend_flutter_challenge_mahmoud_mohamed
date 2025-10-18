import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/data/models/promo_banner_model.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/controller/home_state.dart';
import 'package:itlegend_flutter_challenge/features/offers_age/presentation/widgets/promotional_banner_section/widgets/promo_banner_card.dart';

class PromotionalBannerSection extends StatelessWidget {
  final List<PromoBannerModel> promoBanners; // جديد: param
  const PromotionalBannerSection({super.key, required this.promoBanners});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    if (state is! HomeLoaded) {
      return const SizedBox();
    }

    if (promoBanners.isEmpty) return const SizedBox();
    final banner = promoBanners.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PromoBannerCard(banner: banner),
    );
  }
}
