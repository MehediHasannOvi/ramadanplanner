import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramadanplanner/Util/app_text.dart';
import 'package:ramadanplanner/app/model/locationmodel.dart';

import 'package:sizer/sizer.dart';

import '../controllers/fastscreen_controller.dart';

class FastscreenView extends GetView<FastscreenController> {
  const FastscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 20.h,
            ),
            SizedBox(height: 20.h),
            AppText(
              text: "আপনার নাম এবং লোকেশন সিলেক্ট করুন",
              fontSize: 16,
              color: Colors.white,
            ),
            SizedBox(
              height: 3.h,
            ),
            GetBuilder<FastscreenController>(
              init: FastscreenController(),
              initState: (_) {},
              builder: (_) {
                return Container(
                  height: 6.h,
                  width: 90.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<LocationModel>(
                    underline: const SizedBox(),
                    hint: AppText(
                      text: "আপনার লোকেশন সিলেক্ট করুন",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    dropdownColor: Colors.black,
                    value: controller.selectedLocation,
                    items: controller.locationList.map((location) {
                      return DropdownMenuItem<LocationModel>(
                        value: location,
                        child: Text(location.placeName!),
                      );
                    }).toList(),
                    onChanged: (LocationModel? newValue) {
                      controller.onChangeLocation(newValue);

                      // Use the controller.selectedLocation.lat and controller.selectedLocation.lng as needed
                      print(
                          "Selected Location: ${controller.selectedLocation!.placeName}");
                      print(
                          "Latitude: ${controller.selectedLocation!.lat}, Longitude: ${controller.selectedLocation!.lng}");
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFormField(
              controller: controller.name,
              decoration: const InputDecoration(
                hintText: "নাম লিখুন",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {
                  controller.saveName();
                  
                },
                child: AppText(
                  text: "সাবমিট",
                  fontSize: 10.sp,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
