import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/available_filters_sections.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_header.dart';

class FilteringView extends StatelessWidget {
  const FilteringView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            //Filtering Header
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: FilteringHeader(),
            ),
            SizedBox(height: 20),

            AvailableFiltersSections(),
          ],
        ),
      ),
    );
  }
}
