import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'Util/app_colors.dart';
import 'app/modules/fastscreen.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('daily');
  runApp(Sizer(builder: (context, orientation, deviceType) {
    return GetMaterialApp(
        title: "Application",
        home: Fastpage(),
        // initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          
          scaffoldBackgroundColor: AppColors.primaryColor,
          primarySwatch: Colors.green,
        ));
  }));
}
