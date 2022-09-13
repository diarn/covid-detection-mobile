import 'package:get/get.dart';

import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/result/bindings/result_binding.dart';
import 'package:mobile_app/app/modules/result/views/result_view.dart';
import 'package:mobile_app/app/modules/survey/bindings/survey_binding.dart';
import 'package:mobile_app/app/modules/survey/views/survey_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => ResultView(),
      binding: ResultBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SURVEY,
      page: () => SurveyView(),
      binding: SurveyBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
