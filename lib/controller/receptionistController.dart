import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/model/modelTamu.dart';
import 'package:guestbook/routes/names.dart';

class ReceptionistController extends GetxController {
  String? email;
  String? phone;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Rx<ModelTamu> tamu = Rx<ModelTamu>(ModelTamu());
  TextEditingController kesan = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments["email"];
    phone = Get.arguments["phone"];
  }

  @override
  void onReady() {
    super.onReady();
    tamu.bindStream(
      firestore
          .collection("tamu")
          .where("email", isEqualTo: email!)
          .where("telp", isEqualTo: phone!)
          .snapshots(includeMetadataChanges: true)
          .map((event) => event.docs.map((e) => ModelTamu.fromFirestore(e)).first),
    );
  }

  void tinggalkan() async {
    try {
      await Get.dialog(Card(
        child: ListView(
          children: [
            Text("Masukkan kesan Anda."),
            TextField(
              minLines: 3,
              maxLines: 100,
              controller: kesan,
            ),
            ElevatedButton(onPressed: updateData, child: Text("Simpan")),
          ],
        ),
      ));
      await Get.offAndToNamed(Routes.GUEST);
      return;
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }

  void updateData() async {
    try {
      final data = await firestore.collection("tamu").where("email", isEqualTo: email).get();
      await data.docs.first.reference.update({"kesan": kesan.text, "locStatus": true, "keluar": Timestamp.now()});
      Get.back();
      return;
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }
}
