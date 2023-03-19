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
          title: const Text('Quran Tracker'),
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.quaternaryColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondaryColor,
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
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
