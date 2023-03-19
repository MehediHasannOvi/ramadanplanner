import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 2.h,
            ),
            AppText(
              text: "Assalamualaikum",
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              // textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            AppText(
              text: "MeHedi Hasan Ovi",
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ]),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   margin: const EdgeInsets.all(20),
            //   alignment: Alignment.topLeft,
            //   child:

            // ),

            SizedBox(
              height: 3.h,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Saatnya \nSholat Tarwih",
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quinaryColor,
                    textAlign: TextAlign.left,
                    fontFamily: "Mynerve",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText(
                    text: "Untuk Makassar dan sekitarnya",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              height: 75.h,
              width: double.infinity,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: AppText(
                        text:
                            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xEBF0EFEF),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      AppText(
                        text: "Jadwal Sholat",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      AppText(
                        text: "Lihat Semua",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.quaternaryColor,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 25.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridView.count(
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        manuButton("Daliy Tracker", "1/13" , () => Get.toNamed(Routes.DAILY_TRACKING)),
                        manuButton("Pray Tracker", "1/13",() => Get.toNamed(Routes.PRAY_TRACKER)),
                        manuButton("Quran Tracker", "1/13",() => Get.toNamed(Routes.QURAN_TRACKER)),
                        manuButton("Pray Tracker", "1/13",() => Get.toNamed(Routes.DAILY_TRACKING)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Container manuButton(String name, String com , Function()? tap) {
    return Container(
      height: 20.h,
      width: 10.w,
      child: GestureDetector(
        onTap: tap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                color: AppColors.tertiaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: name,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
                AppText(
                  text: com,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
