import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';
import '../../../../Util/main_button.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';
import '../../../routes/app_pages.dart';
import '../../PrayTracker/controllers/pray_tracker_controller.dart';
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
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
              // textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 5,
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              initState: (_) {},
              builder: (_) {
                return Row(
                  children: [
                    AppText(
                      text: Hive.box('user').get('name') ?? "User",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    Visibility(
                        visible: Hive.box('user').get('name') == null,
                        child: IconButton(
                            onPressed: () {
                              controller.getusername();
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 18,
                            )))
                  ],
                );
              },
            ),
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  // controller.getusername();
                  Get.toNamed(Routes.GRAPH);
                  // Hive.box('user').delete("name");
                },
                icon: Icon(
                  CupertinoIcons.graph_square,
                  color: AppColors.quinaryColor,
                )),
          ],
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
                    text: dinerkaj[controller.getDataIndexForCurrentDate()]
                        .toString(),
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
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.tertiaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ListView(
                        children: [
                          AppText(
                            text: hadis[controller.hadiss()],
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xEBF0EFEF),
                            textAlign: TextAlign.center,
                          ),
                        ],
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
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          print(TimeOfDay.now().minute);
                        },
                        child: AppText(
                          text: "Lihat Semua",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.quaternaryColor,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 25.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridView(
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.9),
                      children: [
                        GetBuilder<PrayTrackerController>(
                          init: PrayTrackerController(),
                          initState: (_) {},
                          builder: (_) {
                            final getpraylanght = Hive.box('daily').length;
                            return manuButton(
                                "Pray Tracker",
                                "${getpraylanght}/7",
                                () => Get.toNamed(Routes.PRAY_TRACKER));
                          },
                        ),
                        GetBuilder<PrayTrackerController>(
                          init: PrayTrackerController(),
                          initState: (_) {},
                          builder: (_) {
                            final dinerkaj = Hive.box('Dtrack').length;
                            return manuButton("Daily Tracker", "${dinerkaj}/13",
                                () => Get.toNamed(Routes.DAILY_TRACKING));
                          },
                        ),
                        manuButton("Quran Tracker", "1/3",
                            () => Get.toNamed(Routes.QURAN_TRACKER)),
                        manuButton("Pray Tracker", "1/13",
                            () => Get.toNamed(Routes.DAILY_TRACKING)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
