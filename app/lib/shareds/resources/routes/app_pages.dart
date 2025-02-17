import 'package:app/screens/auth/login.dart';
import 'package:app/screens/navigation_menus/home_landing_tab_screen.dart';
import 'package:get/get.dart';

import '../../../controllers/bindings/dashboard_tab_binding.dart';
import '../../../screens/onboarding/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const HomeLandingTabScreen(),
      binding: DashboardTabBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    )
  ];
}
