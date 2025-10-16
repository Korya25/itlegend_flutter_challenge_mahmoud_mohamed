// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card_datail.dart';
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
        PlansCardDateail(),
      ],
    );
  }
}
