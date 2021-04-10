import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:guestbook/routes/names.dart';

class AdminController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    if (FirebaseAuth.instance.currentUser == null) {
      log("message");
      Get.offAndToNamed(Routes.AUTH);
      return;
    }
  }
}
