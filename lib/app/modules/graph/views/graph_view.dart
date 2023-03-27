

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/app_colors.dart';
import '../controllers/graph_controller.dart';

class GraphView extends GetView<GraphController> {
  const GraphView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GraphView'),
          centerTitle: true,
        ),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.all(20),
              height: 20.h,
              width: double.infinity,
              child: PieChart(
                dataMap: controller.dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: [
                  Color.fromARGB(255, 5, 230, 95),
                  AppColors.quaternaryColor,
                  AppColors.quinaryColor,
                  AppColors.secondaryColor,
                  AppColors.tertiaryColor,
                ],
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "Namaz",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ))
        ]));
  }
}
