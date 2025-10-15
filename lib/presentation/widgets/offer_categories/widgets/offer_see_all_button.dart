import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/router/app_routes.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class OfferSeeAllButton extends StatelessWidget {
  const OfferSeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text('الكل', style: AppTextStyles.font16GreyBold()),
        GestureDetector(
          onTap: () => context.pushNamed(AppRoutes.filtering),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Icon(Icons.arrow_forward, color: AppColors.textAndIconGrey),
          ),
        ),
      ],
    );
  }
}
