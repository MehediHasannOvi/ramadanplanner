import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../Util/app_text.dart';
import '../../../../Util/app_colors.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText(
              text: 'Ramadan Planner',
              fontSize: 16,
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Version 1.0.0',
              fontSize: 16,
            ),
            const SizedBox(height: 16.0),
            AppText(
              text: 'Developed by: Mehedi Hasan Ovi',
              fontSize: 16,
            ),
            const SizedBox(height: 16.0),
            AppText(text: "Email : mehedihasannovi@gmail.com"),
            const SizedBox(height: 20),
            const Divider(
              color: AppColors.quaternaryColor,
            ),
            AppText(
              text: 'About App',
              fontSize: 18,
              color: AppColors.quaternaryColor,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 16.0),
            AppText(
              fontSize: 14,
              text:
                  "Ramadan Planner App is a mobile application designed to help Muslims keep track of their daily religious activities during the holy month of Ramadan. The app focuses on several key features to assist users in their spiritual journey:",
            ),
            const SizedBox(height: 16.0),
            AppText(
              fontSize: 14,
              text: "1. Quran Tracking",
            ),
            const SizedBox(height: 14.0),
            AppText(
              fontSize: 14,
              text: "2. Namaz Tracking",
            ),
            const SizedBox(height: 14.0),
            AppText(
              fontSize: 14,
              text: "3. Daily Good Deeds Suggestions",
            ),
            const SizedBox(height: 14.0),
            AppText(
              fontSize: 14,
              text: "4. Daily Hadith",
            ),
            const SizedBox(height: 14.0),
            AppText(
              fontSize: 14,
              text: "5. Quran Tracking",
            ),
          ],
        ),
      ),
    );
  }
}
