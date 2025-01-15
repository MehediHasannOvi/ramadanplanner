import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadan_planner/Util/App_text.dart';
import 'package:ramadan_planner/Util/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../controllers/ramadancalendar_controller.dart';

class RamadancalendarView extends GetView<RamadancalendarController> {
  const RamadancalendarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            AppText(
              text: "রমজানের ক্যালেন্ডার", // Ramadan Calendar
              color: Colors.white,
              fontFamily: "Lato",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
               padding: EdgeInsets.all(20),
               margin: EdgeInsets.symmetric(horizontal: 80),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: AppText(
                  text: "সেহরি এবং ইফতারের সময়", // Sehri & Iftar Time
                  color: AppColors.quaternaryColor,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "ঢাকা", // Dhaka
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 10),
                AppText(
                  text: "০৫-০৩-২০২৫", // 05-03-2025
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "তারিখ", // Date
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  text: "সেহরি", // Sehri
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  text: "ইফতার", // Iftar
                  color: Colors.white,
                  fontFamily: "Lato",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                // Determine the label for the current item
                String label = "";
                if (index < 10) {
                  label = "রহমত"; // Rahmat
                } else if (index < 20) {
                  label = "মাগফিরাত"; // Magfirat
                } else if (index < 30) {
                  label = "নাজাত"; // Najat
                }

                return Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 6.h,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "০৫-০৩-২০২৫", // Example date (Bangla format)
                        color: Colors.white70,
                        fontFamily: "Lato",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText(
                        text: "০৪:৩০ am", // Example Sehri time (Bangla format)
                        color: Colors.white70,
                        fontFamily: "Lato",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            text:
                                "০৬:৩০ pm", // Example Iftar time (Bangla format)
                            color: Colors.white70,
                            fontFamily: "Lato",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          if (index % 10 == 0) // Add label every 10 items
                            AppText(
                              text: label,
                              color: Colors.amber,
                              fontFamily: "Lato",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
