import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_category_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_installment_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_type_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtring_location_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtring_sections_divider.dart';

class AvailableFiltersSections extends StatelessWidget {
  const AvailableFiltersSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: FilteringCategorySection(),
        ),
        //
        FiltringSectionsDivider(),

        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: FilteringLocationSection(),
        ),

        FiltringSectionsDivider(),

        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: FilteringInstallmentSection(),
        ),
        SizedBox(height: 20),

        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: FilteringTypeSection(),
        ),
      ],
    );
  }
}
