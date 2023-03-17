
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Util/app_colors.dart';
import '../routes/app_pages.dart';


class Fastpage extends StatelessWidget {
  const Fastpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: AppColors.quaternaryColor,
          onPressed: (){
          
          Get.offNamed(Routes.HOME);  
        }, child: Text("Open")
        ),
      )
    );
  }
}