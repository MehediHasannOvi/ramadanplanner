import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'Util/app_colors.dart';
import 'app/modules/fastscreen.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
        title: "Application",
        home: Fastpage(),
        // initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor,
          primarySwatch: Colors.green,
          
        ));
  }));
}
