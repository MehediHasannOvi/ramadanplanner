import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';

import '../controllers/pray_tracker_controller.dart';

class PrayTrackerView extends GetView<PrayTrackerController> {
  const PrayTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('নামাজ'),
          centerTitle: true,
        ),
        floatingActionButton: GetBuilder<PrayTrackerController>(
          init: PrayTrackerController(),
          initState: (_) {
    },
          builder: (_) {
            return Visibility(
                  visible: controller.delete.value,
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.namazData.clear();
                     
                    },
                    child: const Icon(Icons.delete),
                  ),
                ); 
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              // Top Size Banner Hadis
              Container(
                height: 20.h,
                width: 100.w,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor),
                child: const Center(
                    child: Text(
                  "পবিত্র কোরআনে আল্লাহ তাআলা বলেন, 'নিশ্চয় নামাজ অশ্লীল ও মন্দ কর্ম থেকে বিরত রাখে। ' (সুরা-২৯ আনকাবুত, আয়াত: ৪৫)। হাদিস শরিফে রাসুলুল্লাহ (সা.) বলেন, 'হুজুরে কলব (হৃদয়ের উপস্থিতি) ব্যতীত নামাজ প্রকৃত নামাজ হয় না।",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              // Namaz Traking
              ListTile(
                title: AppText(
                  text: "নামাজ",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                trailing: AppText(
                  text: "পড়েছি",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: AppText(
                  text: "ফজর ",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                
                trailing: GetBuilder<PrayTrackerController>(
                  init: PrayTrackerController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.namazData.get("fazar") ?? false,
                      onChanged: (value) {
                        controller.function(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                  title: AppText(
                    text: "যুহর",
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                 
                  trailing: GetBuilder<PrayTrackerController>(
                    init: PrayTrackerController(),
                    initState: (_) {},
                    builder: (_) {
                      return Checkbox(
                        focusColor: AppColors.quaternaryColor,
                        value: controller.namazData.get("zohar") ?? false,
                        onChanged: (value) {
                          controller.function1(value!);
                        },
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.0, color: Colors.white),
                        ),
                      );
                    },
                  )),

              ListTile(
                title: AppText(
                  text: "আসর",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                
                trailing: GetBuilder<PrayTrackerController>(
                  init: PrayTrackerController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.namazData.get("asor") ?? false,
                      onChanged: (value) {
                        controller.function2(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: AppText(
                  text: "মাগরিব",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                
                trailing: GetBuilder<PrayTrackerController>(
                  init: PrayTrackerController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.namazData.get("magrib") ?? false,
                      onChanged: (value) {
                        controller.function3(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: AppText(
                  text: "ইশা",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                
                trailing: GetBuilder<PrayTrackerController>(
                  init: PrayTrackerController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.namazData.get("isar") ?? false,
                      onChanged: (value) {
                        controller.function4(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              ListTile(
                title: AppText(
                  text: "তারাবীহ",
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                trailing: GetBuilder<PrayTrackerController>(
                  init: PrayTrackerController(),
                  initState: (_) {},
                  builder: (_) {
                    return Checkbox(
                      focusColor: AppColors.quaternaryColor,
                      value: controller.namazData.get("Tarabi") ?? false,
                      onChanged: (value) {
                        controller.function5(value!);
                      },
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(width: 1.0, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ));
  }
}
