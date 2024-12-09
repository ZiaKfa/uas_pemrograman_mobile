import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/dashboard_controller.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/widget/card.dart';
import 'package:uas_pemrograman_mobile/widget/piechart.dart';
import 'package:uas_pemrograman_mobile/widget/sidebar.dart';

class DashboardView extends StatelessWidget {
  final DashboardController dashboardController = Get.put(DashboardController());
  final LoginController loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'),
      ),
      body: Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(()=> Column(
              
              children: [
                CustomCard(
                  title: 'Total Transaksi',
                  description : dashboardController.transaksi.length.toString(),
                  icon: Icons.shopping_cart,
                ),
                CustomCard(
                  title: 'Total Pendapatan',
                  description : dashboardController.totalPenjualan().toString(),
                  icon: Icons.attach_money,
                ),
                if (dashboardController.transaksi.isNotEmpty) PieChart2(),
              ],
            )
            )
            )
          ],
        )
      ),
      drawer: Sidebar(loginController: loginController,),
    );
  }
}