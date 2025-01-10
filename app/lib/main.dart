import 'package:app/core/commons.dart';
import 'package:app/core/constants.dart';
import 'package:app/core/routes.dart';
import 'package:app/core/utils.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppNavigation navigation = Get.put(AppNavigation());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      navigatorKey: navigation.navigatorMainKey,
      initialRoute: RouteConstants.splashRoute,
      routes: AppRoutes.getMainRoutes(),
      navigatorObservers: [
        AppNavigatorObserver(
          onPush: (route, previousRoute) {
            // Handle push event
            debugPrint('Pushed route: ${route.settings.name}');
          },
          onPop: (route, previousRoute) {
            // Handle pop event
            debugPrint('Popped route: ${route.settings.name}');
          },
        ),
      ],
    );
  }
}
