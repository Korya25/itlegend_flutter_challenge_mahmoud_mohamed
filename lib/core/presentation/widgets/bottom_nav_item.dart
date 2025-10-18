import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/presentation/view_model/bottom_nav_item.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class BottomNavItem extends StatelessWidget {
  final BottomNavModel item;
  final bool isSelected;
  final bool isMiddle;

  const BottomNavItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isMiddle,
  });

  static const double iconSize = 24;

  @override
  Widget build(BuildContext context) {
    final iconPath = isSelected ? item.iconPathActive : item.iconPathInactive;

    final textColor = isMiddle && !isSelected
        ? AppColors.primary
        : isSelected
        ? AppColors.textAndIconPrimary
        : AppColors.textAndIconGrey;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushNamed(item.route),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          if (isSelected)
            Positioned(
              bottom: -4,
              child: SvgPicture.asset(AppAssets.navBarLine),
            ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath, width: iconSize, height: iconSize),
              const SizedBox(height: 2),
              Text(
                item.label,
                textAlign: TextAlign.center,
                style: AppTextStyles.font12Medium(color: textColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
