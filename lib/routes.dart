import 'package:get/get.dart';
import 'package:wonderful_indonesia/constant.dart';
import 'package:wonderful_indonesia/ui/screens/attraction_detail_screen.dart';
import 'package:wonderful_indonesia/ui/screens/dashboard/dashboard_screen.dart';
import 'package:wonderful_indonesia/ui/screens/login_screen.dart';

final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
  GetPage<dynamic>(name: RouteName.auth, page: () => const LoginScreen()),
  GetPage<dynamic>(name: RouteName.home, page: () => const DashboardScreen()),
  GetPage<dynamic>(name: RouteName.detail, page: () => AttractionDetail()),
];
