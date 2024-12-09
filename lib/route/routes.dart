import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/view/cashier_view.dart';
import 'package:uas_pemrograman_mobile/view/dashboard_view.dart';
import 'package:uas_pemrograman_mobile/view/login_view.dart';


class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => LoginView(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardView(),
    ),
    GetPage(
      name: '/cashier',
      page: () => CashierView(),
    ),
  ];
}