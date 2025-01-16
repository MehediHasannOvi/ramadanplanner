import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/app_text.dart';
import '../../../../Util/app_colors.dart';
import '../controllers/pray_tracker_controller.dart';

class PrayTrackerView extends GetView<PrayTrackerController> {
  const PrayTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('নামাজ'),
        centerTitle: true,
      ),
     
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Top Banner with Hadis
            Container(
              width: 100.w,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondaryColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: controller.hadisName ?? "হাদিস লোড হচ্ছে...",
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Li",
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: controller.hadisDescription ?? "হাদিস লোড হচ্ছে...",
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: "Li",
                    ),
                  ],
                ),
            ),
            const SizedBox(height: 20),
            // Prayer Tracking Section
            _buildPrayerListTile("নামাজ", "পড়েছি"),
            const SizedBox(height: 10),
            _buildPrayerCheckboxTile("ফজর", "fajar"),
            _buildPrayerCheckboxTile("যুহর", "zohar"),
            _buildPrayerCheckboxTile("আসর", "asor"),
            _buildPrayerCheckboxTile("মাগরিব", "magrib"),
            _buildPrayerCheckboxTile("ইশা", "isha"),
            _buildPrayerCheckboxTile("তারাবীহ", "tarawih"),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerListTile(String title, String trailing) {
    return ListTile(
      title: AppText(
        text: title,
        fontSize: 18,
        color: Colors.white,
      ),
      trailing: AppText(
        text: trailing,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Widget _buildPrayerCheckboxTile(String prayerName, String key) {
    return ListTile(
        title: AppText(
          text: prayerName,
          fontSize: 18,
          color: Colors.white,
        ),
        trailing: GetBuilder<PrayTrackerController>(
          init: PrayTrackerController(),
          initState: (_) {},
          builder: (_) {
            return Checkbox(
              focusColor: AppColors.quaternaryColor,
              value: controller.namazData.get(key) ?? false,
              onChanged: (value) {
                controller.updateNamazData(key, value!);
              },
              side: const BorderSide(width: 1.0, color: Colors.white),
            );
          },
        ));
  }
}
