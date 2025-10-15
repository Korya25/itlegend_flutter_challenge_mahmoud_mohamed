import 'package:itlegend_flutter_challenge/core/constants/app_assets.dart';
import 'package:itlegend_flutter_challenge/core/router/app_routes.dart';

class BottomNavModel {
  final String label;
  final String iconPathActive;
  final String iconPathInactive;
  final String route;

  const BottomNavModel({
    required this.label,
    required this.iconPathActive,
    required this.iconPathInactive,
    required this.route,
  });
}

class BottomNavList {
  static List<BottomNavModel> get items => [
    BottomNavModel(
      label: 'الرئيسية',
      iconPathActive: AppAssets.homeActive,
      iconPathInactive: AppAssets.homeInactive,
      route: AppRoutes.home,
    ),
    BottomNavModel(
      label: 'محادثة',
      iconPathActive: AppAssets.chatActive,
      iconPathInactive: AppAssets.chatInactive,
      route: AppRoutes.chats,
    ),
    BottomNavModel(
      label: 'أضف أعلان',
      iconPathActive: AppAssets.addBoxActive,
      iconPathInactive: AppAssets.addBoxInactive,
      route: AppRoutes.addAdvertisements,
    ),
    BottomNavModel(
      label: 'أعلاناتى',
      iconPathActive: AppAssets.datasetActive,
      iconPathInactive: AppAssets.datasetInactive,
      route: AppRoutes.advertisements,
    ),
    BottomNavModel(
      label: 'حسابى',
      iconPathActive: AppAssets.accountCircleActive,
      iconPathInactive: AppAssets.accountCircleInactive,
      route: AppRoutes.profile,
    ),
  ];
}
