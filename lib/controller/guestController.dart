import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/routes/names.dart';

class GuestController extends GetxController {
  TextEditingController nama = TextEditingController();

  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController keperluan = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void onRegister() async {
    try {
      if (formKey.currentState!.validate()) {
        final check = await firestore.collection("tamu").where("email", isEqualTo: email.text).get();
        if (check.docs.length > 0) {
          await Get.toNamed(Routes.RECEPTIONIST, arguments: {"email": email.text, "phone": phone.text});
          return;
        }
        final add = await firestore.collection("tamu").add({
          "nama": nama.text,
          "telp": phone.text,
          "email": email.text,
          "keperluan": keperluan.text,
          "approve": false,
          "kesan": "",
          "locStatus": false,
          "masuk": Timestamp.now(),
          "timestamp": Timestamp.now(),
        });
        if (add.id.isNotEmpty) {
          await Get.defaultDialog(
              title: "Sukses", content: Text("Silakan menunggu approval"), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
          await Get.toNamed(Routes.RECEPTIONIST, arguments: {"email": email.text, "phone": phone.text});
          return;
        }
        throw "error";
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }
}
