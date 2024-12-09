import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_pemrograman_mobile/controller/dashboard_controller.dart';
import 'package:uas_pemrograman_mobile/widget/indicator.dart';

class PieChart2 extends StatefulWidget {
  const PieChart2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChart2> {
  final DashboardController dashboardController = Get.find<DashboardController>();
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Calculate the data for the pie chart
      Map<String, double> transaksiData = calculateTransaksiData();

      return AspectRatio(
        aspectRatio: 1.3,
        child: Row(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(transaksiData),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: transaksiData.keys.map((category) {
                int index = transaksiData.keys.toList().indexOf(category);
                return Column(
                  children: [
                    Indicator(
                      color: getColor(index),
                      text: "$category : Rp.${transaksiData[category]!.toInt()}",
                      isSquare: true,
                    ),
                    const SizedBox(height: 4),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(width: 28),
          ],
        ),
      );
    });
  }

  // Calculate transaksi data as a map of category and its total value
  Map<String, double> calculateTransaksiData() {
    Map<String, double> data = {};
    for (var transaksi in dashboardController.transaksi) {
      for (var produk in transaksi.produk) {
        data[produk.nama] = (data[produk.nama] ?? 0) + produk.harga.toDouble();
      }
    }
    return data;
  }

  // Generate pie chart sections based on transaksi data
  List<PieChartSectionData> showingSections(Map<String, double> transaksiData) {
    List<double> values = transaksiData.values.toList();
    double total = values.fold(0, (sum, value) => sum + value);

    return List.generate(transaksiData.length, (index) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      final shadows = [const Shadow(color: Colors.black, blurRadius: 2)];
      String category = transaksiData.keys.toList()[index];
      double value = transaksiData[category]!;

      return PieChartSectionData(
        color: getColor(index),
        value: (value / total) * 100,
        title: '${((value / total) * 100).toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    });
  }

  // Return color based on index
  Color getColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.green,
      Colors.orange,
      Colors.red
    ];
    return colors[index % colors.length];
  }
}
