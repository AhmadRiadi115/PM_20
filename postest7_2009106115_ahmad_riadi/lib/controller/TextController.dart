import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController namaTiketCtrl = TextEditingController();

  @override
  void onClose() {
    namaCtrl.dispose();
    emailCtrl.dispose();
    namaTiketCtrl.dispose();
    print("Text Controller sudah terhapus");
    super.onClose();
  }
}
