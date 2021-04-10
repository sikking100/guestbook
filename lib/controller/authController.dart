import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/routes/names.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void onLogin() async {
    try {
      await auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      if (email.text == "sigithadiprawira@gmail.com") {
        Get.offAndToNamed(Routes.ADMIN);
        return;
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }
}
