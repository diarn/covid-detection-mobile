import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../widgets/my_widget.dart';
import '../controllers/survey_controller.dart';

class SurveyView extends GetView<SurveyController> {
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

  _content(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyNavigationTopWidget(
                  func: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Obx(() {
                  return Text.rich(
                    TextSpan(
                      text: "${controller.currentIndex.value + 1} / ${controller.totalIndex.value} ~ ",
                      children: [
                        TextSpan(
                          text: controller.symptoms[controller.currentIndex.value],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Stack(
                  children: [
                    Container(
                      height: Get.height * 0.01,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                    ),
                    Obx(() {
                      return AnimatedContainer(
                        duration: 200.milliseconds,
                        height: Get.height * 0.01,
                        width: controller.getProgressWidth(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.symptoms.length,
                    itemBuilder: (context, x) {
                      return SymptomsView(
                        label: controller.symptoms[x],
                        info: controller.symptomsInfo[x],
                        currentIndex: x + 1,
                        totalIndex: controller.symptoms.length,
                      );
                    },
                  ),
                ),
                Obx(() {
                  if (controller.currentIndex.value == 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: MyButtonWidget(
                            label: "Ya",
                            func: () {
                              controller.mySymptoms
                                  .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                              controller.pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              print(controller.mySymptoms.toString());
                            },
                            color: Colors.blueGrey[300],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.01,
                        ),
                        Expanded(
                          child: MyButtonWidget(
                            label: "Tidak",
                            func: () {
                              controller.mySymptoms
                                  .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                              controller.pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              print(controller.mySymptoms.toString());
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (controller.currentIndex.value == 19) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyButtonWidget(
                                label: "Ya",
                                func: () {
                                  controller.mySymptoms
                                      .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                  controller.showDialog();
                                  print(controller.mySymptoms.toString());
                                },
                                color: Colors.blueGrey[300],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
                              child: MyButtonWidget(
                                label: "Tidak",
                                func: () {
                                  controller.mySymptoms
                                      .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                  controller.showDialog();
                                  print(controller.mySymptoms.toString());
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        MyButtonWidget(
                          label: "Sebelumnya",
                          func: () {
                            controller.pageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                          },
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyButtonWidget(
                                label: "Ya",
                                func: () {
                                  controller.mySymptoms
                                      .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                  controller.pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  print(controller.mySymptoms.toString());
                                },
                                color: Colors.blueGrey[300],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.01,
                            ),
                            Expanded(
                              child: MyButtonWidget(
                                label: "Tidak",
                                func: () {
                                  controller.mySymptoms
                                      .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                  controller.pageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  print(controller.mySymptoms.toString());
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        MyButtonWidget(
                          label: "Sebelumnya",
                          func: () {
                            controller.pageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                          },
                        ),
                      ],
                    );
                  }
                }),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SymptomsView extends StatelessWidget {
  final String label;
  final String info;
  final int currentIndex;
  final int totalIndex;
  const SymptomsView({
    Key? key,
    required this.label,
    required this.info,
    required this.currentIndex,
    required this.totalIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Info Gejala",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Text(info),
      ],
    );
  }
}
