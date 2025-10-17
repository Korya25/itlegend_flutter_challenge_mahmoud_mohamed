import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/presentation/widgets/custom_button.dart';
import 'package:itlegend_flutter_challenge/core/style/font/app_text_styles.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_colors.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_category_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_double_input_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_type_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_location_section.dart';
import 'package:itlegend_flutter_challenge/features/Filtering/presentation/widgets/filtering_sections_divider.dart';

class AvailableFiltersSections extends StatefulWidget {
  const AvailableFiltersSections({super.key});

  @override
  State<AvailableFiltersSections> createState() =>
      _AvailableFiltersSectionsState();
}

class _AvailableFiltersSectionsState extends State<AvailableFiltersSections> {
  String propertyTypesselectedType = 'الكل';
  String roomsCountselectedType = 'الكل';
  String paymentMethodselectedType = 'الكل';
  String condtionselectedType = 'أي';

  final List<String> propertyTypes = [
    'فيلا منفصلة',
    'توين هاوس',
    'الكل',
    'تاون هاوس',
  ];
  final List<String> roomsCount = [
    '4 غرف',
    '5غرف +',
    'غرفتين',
    'الكل',
    '3 غرف',
  ];
  final List<String> paymentMethod = ['كاش', 'تقسيط', 'الكل'];
  final List<String> condtion = ['جاهز', 'أي', 'قيد الأنشاء'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringCategorySection(),
          ),
          FilteringSectionsDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringLocationSection(),
          ),
          FilteringSectionsDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringInstallmentSection(label: 'الأقساط الشهرية'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringTypeSection(
              title: 'النوع',
              types: propertyTypes,
              selectedLabel: propertyTypesselectedType,
              onChanged: (newType) {
                setState(() {
                  propertyTypesselectedType = newType;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringTypeSection(
              title: 'عدد الغرف',
              types: roomsCount,
              selectedLabel: roomsCountselectedType,
              onChanged: (newType) {
                setState(() {
                  roomsCountselectedType = newType;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringInstallmentSection(
              label: 'السعر',
              leftBoxLabel: 'أقصى سعر',
              rightBoxLabel: 'أقل سعر',
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringTypeSection(
              title: 'طريقة الدفع',
              types: paymentMethod,
              selectedLabel: paymentMethodselectedType,
              onChanged: (newType) {
                setState(() {
                  paymentMethodselectedType = newType;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FilteringTypeSection(
              title: 'حالة العقار',
              types: condtion,
              selectedLabel: condtionselectedType,
              onChanged: (newType) {
                setState(() {
                  condtionselectedType = newType;
                });
              },
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              child: Center(
                child: Text(
                  'شاهد 10,000+ نتائج',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font16Bold().copyWith(
                    color: AppColors.backPrimary,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
