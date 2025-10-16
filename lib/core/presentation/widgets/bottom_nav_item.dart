import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected
                  ? AppColors.textAndIconPrimary
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Column(
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
      ),
    );
  }
}
