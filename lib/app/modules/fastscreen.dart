import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'home/views/home_view.dart';

class Fastpage extends StatefulWidget {
  const Fastpage({super.key});

  @override
  State<Fastpage> createState() => _FastpageState();
}

class _FastpageState extends State<Fastpage> {
  @override
  void initState() {
   
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () =>Get.offNamed(Routes.HOME));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0d2329),
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
