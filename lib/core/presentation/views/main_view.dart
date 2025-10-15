import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/presentation/widgets/custom_bottom_nav_bar.dart';

class MainView extends StatelessWidget {
  final Widget child;

  const MainView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: child),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: const CustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
