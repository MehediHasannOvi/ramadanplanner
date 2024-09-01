import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ramadanplanner/Util/app_colors.dart';
import 'package:ramadanplanner/Util/app_text.dart';
import '../controllers/compass_controller.dart';

class CompassView extends GetView<CompassController> {
  const CompassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compass'),
        centerTitle: true,
      ),
      body: Center(
        child: AppText(
          text: 'Compass is working ',
          color: AppColors.quaternaryColor,
        ),
      )
        
      
    );
  }
}
