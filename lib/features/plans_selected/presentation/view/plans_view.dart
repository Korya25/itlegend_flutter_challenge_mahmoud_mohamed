import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_view_header.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Plans Header
              SizedBox(height: 30),
              PlansViewHeader(),
              SizedBox(height: 30),
              PlansCard(),
            ],
          ),
        ),
      ),
    );
  }
}
