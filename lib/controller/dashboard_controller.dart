import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uas_pemrograman_mobile/model/transaksi.dart';
import 'package:uas_pemrograman_mobile/model/produk.dart';

class DashboardController extends GetxController {
  var transaksi = <Transaksi>[].obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadTransaksi();
  }

  int totalPenjualan() {
    int total = 0;
    for (var item in transaksi) {
      for (var produk in item.produk) {
        total += produk.harga;
      }
    }
    return total;
  }

  Future<void> saveTransaksi() async {
    List<String> encodedTransaksi = transaksi.map((trans) {
      String produkString = trans.produk
            .map((produk) => '${produk.id}-${produk.nama}-${produk.harga}')
          .join(',');
      return '${trans.id}:$produkString';
    }).toList();

    await storage.write('transaksi', encodedTransaksi);
  }

  void loadTransaksi() {
    List<dynamic>? storedData = storage.read<List<dynamic>>('transaksi');
    if (storedData != null) {
      transaksi.value = storedData.map((encodedTrans) {
        var parts = (encodedTrans as String).split(':');
        int id = int.parse(parts[0]);
        List<Produk> produkList = parts[1]
            .split(',')
            .map((produkString) {
              var produkParts = produkString.split('-');
              return Produk(
                id: int.parse(produkParts[0]),
                nama: produkParts[1],
                harga: int.parse(produkParts[2]),
              );
            })
            .toList();
        return Transaksi(id: id, produk: produkList);
      }).toList();
    }
  }

  void addTransaksi(Transaksi newTransaksi) {
    transaksi.add(newTransaksi);
    saveTransaksi();
  }

  void clearTransaksi() {
    transaksi.clear();
    storage.remove('transaksi');
  }
}
