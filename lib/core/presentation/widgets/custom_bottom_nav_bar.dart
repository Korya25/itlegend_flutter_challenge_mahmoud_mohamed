// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/presentation/view_model/bottom_nav_item.dart';
import 'package:itlegend_flutter_challenge/core/presentation/widgets/bottom_nav_item.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.path;
    final navItems = BottomNavList.items;
    return Container(
      color: AppColors.backPrimary,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.backPrimary,
          border: Border(
            top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navItems.map((item) {
            final isSelected = currentPath.startsWith(item.route);
            final isMiddle = navItems.indexOf(item) == navItems.length ~/ 2;

            return BottomNavItem(
              item: item,
              isSelected: isSelected,
              isMiddle: isMiddle,
            );
          }).toList(),
        ),
      ),
    );
  }
}
