import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestController extends GetxController {
  TextEditingController nama = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController keperluan = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  void onRegister() async {
    try {
      if (formKey.currentState!.validate()) {
        //register to firestore
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }
}
