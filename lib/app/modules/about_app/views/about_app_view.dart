import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/widgets/my_widget.dart';

import '../controllers/about_app_controller.dart';

class AboutAppView extends GetView<AboutAppController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height * 0.38,
              width: double.infinity,
              child: Image.asset(
                "assets/a.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            _content(context),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MyNavigationTopWidget(func: () {
            Get.back();
          }),
        ),
        SizedBox(
          height: Get.height * 0.2,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tentang Aplikasi"),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                      "Aplikasi ini dibangun untuk memudahkan masyarakat melakukan pengecekan indikasi covid berdasarkan gejala-gejala yang dialaminya."),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
