import 'package:flutter/material.dart';
import 'package:ramadan_planner/Util/app_text.dart';
import 'package:ramadan_planner/Util/app_colors.dart';
import 'package:sizer/sizer.dart';

manuButton(String name, String com, Function()? tap) {
  return SizedBox(
    height: 20,
    width: 20,
    child: GestureDetector(
      onTap: tap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8.h,
            width: 8.h,
            decoration: BoxDecoration(
              color: AppColors.tertiaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: name,
                fontSize: 15,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
              AppText(
                text: com,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
            ],
          )
        ],
      ),
    ),
  );
}
