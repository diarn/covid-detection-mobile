import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/routes/app_pages.dart';
import 'package:mobile_app/app/widgets/my_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
            MyBackgroundImage(height: Get.height, width: Get.width),
            _content(context),
          ],
        ),
      ),
    );
  }

  Column _content(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Get.width * 0.9,
                  ),
                  child: Text(
                    "Selamat Datang di Aplikasi Deteksi Gejala Awal Covid",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Text(
                  "developed by diarn",
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                MyButtonWidget(
                  label: "Cek Gejala Awal Covid",
                  func: () {
                    Get.toNamed(Routes.SURVEY, arguments: "main covid");
                  },
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                MyButtonWidget(
                  label: "Cek Gejala Awal Varian Covid",
                  func: () {
                    Get.toNamed(Routes.SURVEY, arguments: "variant");
                  },
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                MyButtonWidget(
                  label: "Tentang Aplikasi",
                  func: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
