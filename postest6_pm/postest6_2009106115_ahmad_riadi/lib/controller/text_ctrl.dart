import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  var namaDepan = "".obs;
  var email = "".obs;
  var namaTiket = "".obs;

  final namaDepanCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final namaTiketCtrl = TextEditingController();

  onPressed() {
    namaDepan = namaDepanCtrl.text.obs;
    email = emailCtrl.text.obs;
    namaTiket = namaTiketCtrl.text.obs;
  }

  // Mirip dispose() di Stateful
  @override
  void onClose() {
    namaDepanCtrl.dispose();
    emailCtrl.dispose();
    namaTiketCtrl.dispose();
    super.onClose();
  }
}
