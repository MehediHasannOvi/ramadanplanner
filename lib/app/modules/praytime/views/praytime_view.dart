import 'package:flutter/material.dart'; 
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ramadan_planner/Util/app_text.dart';
import 'package:sizer/sizer.dart';
import '../controllers/praytime_controller.dart';

class PraytimeView extends GetView<PraytimeController> {
  const PraytimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(
            width: 10,
          ),
          GetBuilder<PraytimeController>(
            init: PraytimeController(),
            initState: (_) {},
            builder: (_) {
              return AppText(
                text: controller.location ?? 'Location not set',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              );
            },
          )
        ],
      )),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            GetBuilder<PraytimeController>(
              init: PraytimeController(),
              initState: (_) {},
              builder: (_) {
                return AppText(
                  text: controller.formattedTime,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lato",
                );
              },
            ),
            AppText(
              text: controller.getCurrentPrayerTime(),
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: "Lato",
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                AppText(
                  text: 'Date',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lato",
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 1,
                  width: 50.w,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppText(
              text: controller.hijriDate.toString(),
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: "Lato",
            ),
            const SizedBox(
              height: 10,
            ),
            AppText(
              text: controller.date.toString(),
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: "Lato",
            ),
            const SizedBox(
              height: 20,
            ),
            prayTime(
              title: 'ফজর',
              time: controller.getFajrTime(),
              icon: 'assets/icon/Icon_Fajr.svg',
            ),
            prayTime(
              title: 'সূর্যোদয়',
              time: controller.getSunRiceTime(),
              icon: 'assets/icon/Sunrise.svg',
            ),
            prayTime(
              title: 'যুহর',
              time: controller.getdhuhrTime(),
              icon: 'assets/icon/Icon_Dhuhr.svg',
            ),
            prayTime(
              title: 'আসর',
              time: controller.getasrTime(),
              icon: 'assets/icon/Icon_Asr.svg',
            ),
            prayTime(
              title: 'মাগরিব',
              time: controller.getmaghribTime(),
              icon: 'assets/icon/Icon_Maghrib.svg',
            ),
            prayTime(
              title: 'ইশা',
              time: controller.getishaTime(),
              icon: 'assets/icon/Icon_Isha.svg',
            ),
          ],
        ),
      ),
    );
  }

  ListTile prayTime({required String? title, String? time, String? icon}) {
    return ListTile(
      leading: SvgPicture.asset(
        icon!,
        color: Colors.white,
        height: 30,
        width: 30,
      ),
      title: AppText(
        text: title!,
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "Lato",
      ),
      trailing: AppText(
        text: time!,
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: "Lato",
      ),
    );
  }
}
