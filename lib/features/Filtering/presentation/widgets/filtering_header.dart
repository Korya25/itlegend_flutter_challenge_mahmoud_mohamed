import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/x_icon_painter.dart';

class FilteringHeader extends StatelessWidget {
  const FilteringHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'رجوع للأفتراضى',
          textAlign: TextAlign.center,
          style: AppTextStyles.font16Bold().copyWith(color: Color(0xff0079FE)),
        ),
        Row(
          spacing: 12,
          children: [
            Text(
              'فلترة',
              textAlign: TextAlign.right,
              style: AppTextStyles.font24MeduimPrimary(),
            ),

            GestureDetector(
              onTap: () => context.pop(),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CustomPaint(painter: XIconPainter()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
