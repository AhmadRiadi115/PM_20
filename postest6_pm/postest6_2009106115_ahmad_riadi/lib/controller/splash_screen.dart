import 'dart:async';
import 'package:get/get.dart';
import 'package:postest6_2009106115_ahmad_riadi/mainpage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      Get.off(Home());
    });
  }
}
