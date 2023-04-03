import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/App_text.dart';
import '../../../../Util/app_colors.dart';
import '../controllers/quran_tracker_controller.dart';

class QuranTrackerView extends GetView<QuranTrackerController> {
  const QuranTrackerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('কোরআন'),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
                height: 20.h,
                width: 100.w,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor),
                child: const Center(
                    child: Text(
                  "আবূ হাযিম (রহ.) সাহল ইবনু সা‘দ (রাযি.) হতে বর্ণনা করেন যে, সাহাবায়ে কিরাম নবী সাল্লাল্লাহু আলাইহি ওয়াসাল্লাম -এর সঙ্গে তহবন্দ কাঁধে বেঁধে সালাত আদায় করেছিলেন।",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              AppText(
                text: "কুরআন ট্র্যাকিং ",
                fontSize: 18,
                color: AppColors.quaternaryColor,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppText(
                        text: "আয়াত",
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 7.h,
                        width: 22.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.quaternaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryColor,
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.visibilitychange(value);
                          },
                          controller: controller.ayatController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "আয়াত নং",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppText(
                        text: "পৃষ্ঠা",
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 7.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.quaternaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryColor,
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            controller.visibilitychange(value);
                          },
                          controller: controller.pageController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "পৃষ্ঠা নং",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AppText(
                        text: "পারা",
                        fontSize: 16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 7.h,
                        width: 22.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.quaternaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryColor,
                        ),
                        child: TextFormField(
                          controller: controller.paraController,
                          onChanged: (value) {
                            controller.visibilitychange(value);
                          },
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "পারা নং",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GetBuilder<QuranTrackerController>(
                init: QuranTrackerController(),
                initState: (_) {},
                builder: (_) {
                  return Visibility(
                    visible: controller.visibility,
                    child: Center(
                      child: MaterialButton(
                          color: AppColors.quaternaryColor,
                          minWidth: 30.w,
                          height: 5.5.h, //height of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            controller.getquranData();
                          },
                          child: AppText(
                            text: "সেভ করুন",
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              
              AppText(
                text: "আপনার আগের পড়া...",
                color: AppColors.quaternaryColor,
                fontSize: 16,
              ),
              const Divider(
                color: AppColors.quaternaryColor,
              ),
              GetBuilder<QuranTrackerController>(
                init: QuranTrackerController(),
                initState: (_) {},
                builder: (_) {
                  return Container(
                    height: 12.h,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            AppText(
                              text: "আয়াত",
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: controller.quranData.get("ayat") ?? "0",
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AppText(
                              text: "পৃষ্ঠা",
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: controller.quranData.get("page") ?? "0",
                              fontSize: 16,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AppText(
                              text: "পারা",
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: controller.quranData.get("para") ?? "0",
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
