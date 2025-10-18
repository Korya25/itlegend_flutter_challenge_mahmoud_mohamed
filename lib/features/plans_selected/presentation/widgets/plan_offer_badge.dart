import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';

class PlanOfferBadge extends StatefulWidget {
  const PlanOfferBadge({super.key, required this.badgeText});
  final String badgeText;

  @override
  State<PlanOfferBadge> createState() => _PlanOfferBadgeState();
}

class _PlanOfferBadgeState extends State<PlanOfferBadge> {
  bool textlength() {
    if (widget.badgeText.length < 18) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AppAssets.planOfferBadgelarge,
          // height: textlength() ? 31 : 31,
          width: textlength() ? 145 : 110,
        ),
        Positioned(
          right: 5,
          top: 8,
          child: Text(
            widget.badgeText,

            style: AppTextStyles.font12Medium(color: Color(0xffFF4144)),
          ),
        ),
      ],
    );
  }
}
