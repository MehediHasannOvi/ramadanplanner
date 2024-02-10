import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';
import '../controllers/daily_tracking_controller.dart';

class DailyTrackingView extends GetView<DailyTrackingController> {
  const DailyTrackingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('দিনের কাজ'),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("sokalerJikir") ?? false,
                      onChanged: (value) {
                        controller.function(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "সকালের জিকির", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("sondarJikir") ?? false,
                      onChanged: (value) {
                        controller.function2(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "সন্ধ্যার জিকির", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("dansadka") ?? false,
                      onChanged: (value) {
                        controller.function3(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "দান সদকা", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("dinerkaj") ?? false,
                      onChanged: (value) {
                        controller.function4(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "দিনের কাজ", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("jamatenamaz") ?? false,
                      onChanged: (value) {
                        controller.function5(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "জামাতে সালাত আদায়", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("istegfa") ?? false,
                      onChanged: (value) {
                        controller.function6(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "কমপক্ষে ৭০ বার ইস্তেগফার", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("quranteloyat") ?? false,
                      onChanged: (value) {
                        controller.function7(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title:
                    AppText(text: "কোরআন তেলাওয়াত ও তাদাব্বুর", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value:
                          controller.dailyData.get("allahnammukhosto") ?? false,
                      onChanged: (value) {
                        controller.function8(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "আল্লাহর নাম মুখস্ত", fontSize: 16),
              ),
              ListTile(
                leading: GetBuilder<DailyTrackingController>(
                  init: DailyTrackingController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.dailyData.get("ghumerzikir") ?? false,
                      onChanged: (value) {
                        controller.function9(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
                title: AppText(text: "ঘুমের পূর্বে জিকির", fontSize: 16),
              ),
            ],
          )),
    );
  }
}
