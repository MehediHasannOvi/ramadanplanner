import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ramadanplanner/Util/App_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/app_colors.dart';
import '../controllers/calander_controller.dart';

class CalanderView extends GetView<CalanderController> {
  const CalanderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        topbar(),
        Container(
          height: 70.h,
          width: 100.w,
          margin: const EdgeInsets.all(10),
          child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 10.h,
              smRatio: 0.5,
              fixedColumnsColor: Colors.amber,
              fixedCornerColor: Colors.amber,
              dataTextStyle: TextStyle(fontSize: 10.sp, color: Colors.white),
              headingRowDecoration: const BoxDecoration(
                color: Colors.amber,
              ),
              headingTextStyle: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              columns: const [
                DataColumn2(
                  label: Text(
                    'তারিখ',
                    selectionColor: Colors.amber,
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('সেহরির'),
                ),
                DataColumn(
                  label: Text('ইফতার'),
                ),
                DataColumn(
                  label: Text('মোট সময়'),
                ),
              ],
              rows: List<DataRow>.generate(
                  30,
                  (index) => const DataRow(cells: [
                        DataCell(Text(
                          '১৪/০৪/২০২১',
                        )),
                        DataCell(Text("০৫:১২")),
                        DataCell(Text(
                          "০৬:১২",
                        )),
                        DataCell(Text(
                          "১২:০০",
                        )),
                      ]))),
        ),
      ],
    ));
  }

  // here display today date and time
  Container topbar() {
    return Container(
      height: 15.h,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tertiaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "সেহরির",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              AppText(
                text: "05:59",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Mosque.png',
                height: 6.h,
              ),
              AppText(
                text: "১ম রমজান",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "ইফতার",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
              AppText(
                text: "06:59",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
