import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/number_of_views_container.dart';

class PlansCardDateail extends StatelessWidget {
  const PlansCardDateail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //PlansCardNumberOfViews
        NumberOfViewsContainer(),

        // items List
        Column(
          children: [
            // detail
            Row(
              children: [
                Text(
                  'صلاحية الأعلان 30 يوم',
                  style: const TextStyle(
                    color: Color(0xFF090F1F),
                    fontSize: 14,
                    fontFamily: 'Tajawal',
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
