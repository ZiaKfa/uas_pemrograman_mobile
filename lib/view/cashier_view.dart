import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/cashier_controller.dart';
import 'package:uas_pemrograman_mobile/controller/login_controller.dart';
import 'package:uas_pemrograman_mobile/widget/add_modal.dart';
import 'package:uas_pemrograman_mobile/widget/card.dart';
import 'package:uas_pemrograman_mobile/widget/button.dart';
import 'package:uas_pemrograman_mobile/widget/edit_modal.dart';
import 'package:uas_pemrograman_mobile/widget/sidebar.dart';

class CashierView extends StatelessWidget {
  final CashierController kasirController = Get.put(CashierController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasir'),
      ),
      drawer: Sidebar(loginController: loginController),
      body: Column(
        children: [
          // List of items
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: kasirController.barang.length,
                itemBuilder: (context, index) {
                  final barang = kasirController.barang[index];
                  return CustomCard(
                    title: barang.nama,
                    description: 'Rp ${barang.harga}',
                    icon: Icons.shopping_cart,
                    trailing: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (_) => EditItemModal(
                                barang: barang,
                                index: index,
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            kasirController.deleteBarang(barang);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // Total Price
          Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(
                () => Text(
                  'Total Harga: Rp ${kasirController.total.value}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Checkout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
      // Floating Action Button for Adding Items
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => AddItemModal(),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
