import 'package:flutter/material.dart';
import 'package:super_labs_task/presentation/modules/dashboard/dashboard_view.dart';
import 'package:super_labs_task/presentation/modules/splash/splash_view.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String dashboard = "dashboard";

  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    splash: (context) => const SplashView(),
    dashboard: (context) => const DashboardView()
  };
}
