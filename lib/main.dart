import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itlegend_flutter_challenge/core/router/app_router.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
    // const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
