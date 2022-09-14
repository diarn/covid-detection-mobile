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
                      text: controller.type.value == "main covid"
                          ? "${controller.currentIndex.value + 1} / ${controller.mainSymptomsTotalIndex.value} ~ "
                          : "${controller.currentIndex.value + 1} / ${controller.variantSymptomsTotalIndex.value} ~ ",
                      children: [
                        TextSpan(
                          text: controller.type.value == "main covid"
                              ? controller.mainSymptoms[controller.currentIndex.value]
                              : controller.variantSymptoms[controller.currentIndex.value],
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
                Obx(() {
                  return Expanded(
                    child: PageView.builder(
                      controller:
                          controller.type.value == "main covid" ? controller.mainPageController : controller.variantPageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.type.value == "main covid"
                          ? controller.mainSymptoms.length
                          : controller.variantSymptoms.length,
                      itemBuilder: (context, x) {
                        return SymptomsView(
                          label:
                              controller.type.value == "main covid" ? controller.mainSymptoms[x] : controller.variantSymptoms[x],
                          info: controller.type.value == "main covid"
                              ? controller.mainSymptomsInfo[x]
                              : controller.variantSymptomsInfo[x],
                          currentIndex: x + 1,
                          totalIndex: controller.type.value == "main covid"
                              ? controller.mainSymptoms.length
                              : controller.variantSymptoms.length,
                        );
                      },
                    ),
                  );
                }),
                Obx(() {
                  if (controller.currentIndex.value == 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: MyButtonWidget(
                            label: "Ya",
                            func: () {
                              if (controller.type.value == "main covid") {
                                controller.myMainSymptoms
                                    .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                controller.mainPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              } else {
                                controller.myVariantSymptoms
                                    .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                controller.variantPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              }
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
                              if (controller.type.value == "main covid") {
                                controller.myMainSymptoms
                                    .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                controller.mainPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              } else {
                                controller.myVariantSymptoms
                                    .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                controller.variantPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (controller.currentIndex.value == controller.totalIndex.value) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyButtonWidget(
                                label: "Ya",
                                func: () {
                                  if (controller.type.value == "main covid") {
                                    controller.myMainSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                    controller.checkPositiveSymptoms();
                                  } else {
                                    controller.myVariantSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                    controller.checkPositiveSymptoms();
                                  }
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
                                  if (controller.type.value == "main covid") {
                                    controller.myMainSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                    controller.checkPositiveSymptoms();
                                  } else {
                                    controller.myVariantSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                    controller.checkPositiveSymptoms();
                                  }
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
                            if (controller.type.value == "main covid") {
                              controller.mainPageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                            } else {
                              controller.variantPageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                            }
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
                                  if (controller.type.value == "main covid") {
                                    controller.myMainSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                    controller.mainPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  } else {
                                    controller.myVariantSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [1]);
                                    controller.variantPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  }
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
                                  if (controller.type.value == "main covid") {
                                    controller.myMainSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                    controller.mainPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  } else {
                                    controller.myVariantSymptoms
                                        .replaceRange(controller.currentIndex.value, controller.currentIndex.value + 1, [0]);
                                    controller.variantPageController.nextPage(duration: 200.milliseconds, curve: Curves.ease);
                                  }
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
                            if (controller.type.value == "main covid") {
                              controller.mainPageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                            } else {
                              controller.variantPageController.previousPage(duration: 200.milliseconds, curve: Curves.ease);
                            }
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
