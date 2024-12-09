import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/cashier_controller.dart';
import 'package:uas_pemrograman_mobile/controller/dashboard_controller.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/widget/button.dart';
import 'package:uas_pemrograman_mobile/widget/card.dart';
import 'package:uas_pemrograman_mobile/widget/sidebar.dart';
import 'package:uas_pemrograman_mobile/widget/text_form.dart';

class CashierView extends StatelessWidget {
  final CashierController kasirController = Get.put(CashierController());
  final DashboardController dashboardController = Get.put(DashboardController());
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Kasir')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: kasirController.barang.length,
                itemBuilder: (context, index){
                  return CustomCard(
                    title: kasirController.barang[index].nama,
                    description: kasirController.barang[index].harga.toString(),
                    icon: Icons.shopping_cart,
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        kasirController.deleteBarang(kasirController.barang[index]);
                      },
                    )
                  );
                },
              ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text(
                  'Total Harga: ${kasirController.total}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
              children: [
                TextForm(
                controller: namaController,
                labelText: 'Nama Barang',
                hintText: 'Masukkan Nama Barang',
                ),
                const SizedBox(height: 10),
                TextForm(
                controller: hargaController,
                labelText: 'Harga Barang',
                hintText: 'Masukkan Harga Barang',
                ),
                const SizedBox(height: 10),
                CustomButton(
                text: 'Tambah Barang',
                onPressed: () {
                  kasirController.addBarang(namaController.text, int.parse(hargaController.text));
                },
                ),
                const SizedBox(height: 10),
                CustomButton(
                text: 'Checkout',
                onPressed: () {
                  kasirController.checkout();
                },
                ),
              ],
              ),
            ),
          ],
        ),
      ),
      drawer: Sidebar(loginController: loginController,),
    );
  }
}