import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/dashboard_controller.dart';
import 'package:uas_pemrograman_mobile/model/produk.dart';
import 'package:uas_pemrograman_mobile/model/transaksi.dart';

class CashierController extends GetxController {
  var barang = <Produk>[].obs;
  var total = 0.obs;

  final DashboardController dashboardController = Get.find();

  void addBarang(String nama, int harga){
    var produk = Produk(
      id: barang.length + 1,
      nama: nama,
      harga: harga,
    );
    barang.add(produk);
    total.value += produk.harga;
  }

  void deleteBarang(Produk produk){
    barang.remove(produk);
    total.value -= produk.harga;
  }

  void updateBarang(Produk produk, String nama, int harga){
    var index = barang.indexWhere((element) => element.id == produk.id);
    barang[index] = Produk(
      id: produk.id,
      nama: nama,
      harga: harga,
    );
    total.value = 0;
    for (var element in barang) {
      total.value += element.harga;
    }
  }

  void checkout(){
    if (barang.isEmpty){
      Get.snackbar('Error', 'Tidak ada barang yang terjual');
      return;
    } else {
      dashboardController.transaksi.add(Transaksi(
        id: dashboardController.transaksi.length + 1,
        produk: List<Produk>.from(barang),
      ));
      dashboardController.saveTransaksi();
      barang.clear();
      total.value = 0;
      Get.snackbar('Success', 'Transaksi berhasil');
    }
  }
}