import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itlegend_flutter_challenge/core/di/get_it.dart';
import 'package:itlegend_flutter_challenge/core/router/app_router.dart';
import 'package:itlegend_flutter_challenge/core/style/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
