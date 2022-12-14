import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButtonWidget extends StatelessWidget {
  final String label;
  final Function()? func;
  final Color? color;
  const MyButtonWidget({
    Key? key,
    required this.label,
    required this.func,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color != null ? color : Colors.blue,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: func,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Text(
              label,
            ),
          ),
        ),
      ),
    );
  }
}

class MyBackgroundImage extends StatelessWidget {
  final double height;
  final double width;
  const MyBackgroundImage({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset(
        "assets/bg5.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyNavigationTopWidget extends StatelessWidget {
  final Function()? func;
  const MyNavigationTopWidget({
    Key? key,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      child: Row(
        children: [
          Material(
            color: Colors.blue.withAlpha(150),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: func,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Icon(
                  FluentSystemIcons.ic_fluent_chevron_left_regular,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Kembali"),
        ],
      ),
    );
  }
}

class ResultDataWidget extends StatelessWidget {
  final String label;
  final double resultValue;
  const ResultDataWidget({
    Key? key,
    required this.label,
    required this.resultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(resultValue.toString() + " %"),
          ],
        ),
        Stack(
          children: [
            Container(
              height: Get.height * 0.01,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueGrey[300],
              ),
            ),
            Container(
              height: Get.height * 0.01,
              width: (Get.width - 80) * (0.01 * resultValue),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
