import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:daynightbanner/daynightbanner.dart';
import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';
import '../../../../Util/main_button.dart';
import '../../../data/dinerkaj.dart';
import '../../../data/hadis.dart';
import '../../../routes/app_pages.dart';
import '../../DailyTracking/controllers/daily_tracking_controller.dart';
import '../../PrayTracker/controllers/pray_tracker_controller.dart';
import '../../QuranTracker/controllers/quran_tracker_controller.dart';
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
              text: "আস-সালামু আলাইকুম",
              fontSize: 14,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    // this function is for edit name button
                    Visibility(
                        visible: Hive.box('user').get('name') == null,
                        child: IconButton(
                            onPressed: () {
                              print(
                                  "Print Fajar Time  ${DateFormat.jm().format(controller.prayerTimes!.fajr)}");
                              print(
                                  "Print Fajar Time  ${DateFormat.jm().format(controller.prayerTimes!.dhuhr)}");
                            },
                            icon: const Icon(
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
                onPressed: () async {
                  // Get.toNamed(Routes.ABOUT);
                  print("Fajr Time  ${controller.getFajrTime()}");
                  print("dhuhr Time ${controller.getdhuhrTime()}");
                  print("Asr Time ${controller.getasrTime()}");
                  print("Maghrin Time ${controller.getmaghribTime()}");
                  print("Isha Time ${controller.getishaTime()}");
                },
                icon: const Icon(
                  CupertinoIcons.heart_circle,
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
                    text: "পবিত্র মাহে \nরামাদানের শুভেচ্ছা",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.quinaryColor,
                    textAlign: TextAlign.left,
                    fontFamily: "Li",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText(
                    text: dinerkaj[controller.getDataIndexForCurrentDate()]
                        .toString(),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1,
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
                  // this is for day night banner here add namaz time and date
                  // Container(
                  //   height: 10.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.tertiaryColor,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: AppText(
                  //     text: DateFormat.jm().format(controller.prayerTimes!.fajr).toString(),
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w300,
                  //     color: Colors.white,
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  SizedBox(
                    height: 4.h,
                  ),
                  // this is for hadis section
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
                            fontSize: 16,
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

                  // this is for daily tracker section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "আজকের আমল",
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      color: AppColors.quaternaryColor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 26.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridView(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.9),
                      children: [
                        GetBuilder<PrayTrackerController>(
                          init: PrayTrackerController(),
                          initState: (_) {},
                          builder: (_) {
                            final getpraylanght = Hive.box('daily').length;
                            return manuButton("নামাজ", "$getpraylanght/6",
                                () => Get.toNamed(Routes.PRAY_TRACKER));
                          },
                        ),
                        GetBuilder<DailyTrackingController>(
                          init: DailyTrackingController(),
                          initState: (_) {},
                          builder: (_) {
                            final dinerkaj = Hive.box('Dtrack').length;
                            return manuButton("দিনের কাজ", "$dinerkaj/9",
                                () => Get.toNamed(Routes.DAILY_TRACKING));
                          },
                        ),
                        GetBuilder<QuranTrackerController>(
                          init: QuranTrackerController(),
                          initState: (_) {},
                          builder: (_) {
                            final quranData = Hive.box('quranData').length;
                            return manuButton("কোরআন", "$quranData/3",
                                () => Get.toNamed(Routes.QURAN_TRACKER));
                          },
                        ),
                        manuButton("আল্লাহ'র নাম", "99",
                            () => Get.toNamed(Routes.ALLAH_NAME)),
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
