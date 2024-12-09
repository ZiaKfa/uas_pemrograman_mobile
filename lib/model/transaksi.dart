import 'package:uas_pemrograman_mobile/model/produk.dart';

class Transaksi {
  int id;
  List<Produk> produk;

  Transaksi({
    required this.id,
    required this.produk,
  });
}