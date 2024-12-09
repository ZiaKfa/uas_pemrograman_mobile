import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/cashier_controller.dart';
import 'package:uas_pemrograman_mobile/model/produk.dart';

class EditItemModal extends StatelessWidget {
  final Produk barang;
  final int index;

  EditItemModal({required this.barang, required this.index});

  final CashierController kasirController = Get.find<CashierController>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController(text: barang.nama);
    final TextEditingController hargaController = TextEditingController(text: barang.harga.toString());

    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Edit Barang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nama Barang',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Harga Barang',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: hargaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Harga Barang',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (namaController.text.isNotEmpty &&
                      hargaController.text.isNotEmpty) {
                    kasirController.updateBarang(
                      barang,
                      namaController.text,
                      int.tryParse(hargaController.text) ?? 0,
                    );
                    Get.back(); // Close the modal
                  } else {
                    Get.snackbar('Error', 'Isi semua data barang!');
                  }
                },
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
