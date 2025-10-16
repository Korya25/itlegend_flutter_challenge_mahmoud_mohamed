// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_header.dart';

class PlansCardBody extends StatelessWidget {
  const PlansCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Header
        PlansCardHeader(),

        // Devider
        Divider(color: Colors.black.withOpacity(0.1), thickness: 1),

        // Detail
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}
