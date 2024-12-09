import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uas_pemrograman_mobile/controller/cashier_controller.dart';
import 'package:uas_pemrograman_mobile/controller/dashboard_controller.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/route/routes.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  Get.put(DashboardController());
  Get.put(CashierController());
  Get.put(LoginController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX App',
      initialRoute: '/',
      getPages: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


