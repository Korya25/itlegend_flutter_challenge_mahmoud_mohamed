// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';

class ContactWithSupport extends StatelessWidget {
  const ContactWithSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: Color(0xFFF7F7F7),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.05000000074505806),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'باقات مخصصة لك',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.font14MeduimPrimary(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'تواصل معنا لأختيار الباقة المناسبة لك',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.font12RegularPrimary(),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'فريق المبيعات',
                textAlign: TextAlign.center,
                style: AppTextStyles.font16Bold().copyWith(
                  color: Color(0xff0079FE),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
