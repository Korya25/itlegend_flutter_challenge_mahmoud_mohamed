// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FiltringSectionsDivider extends StatelessWidget {
  const FiltringSectionsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20),
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Colors.black.withOpacity(0.10000000149011612),
            ),
          ),
        ),
      ),
    );
  }
}
