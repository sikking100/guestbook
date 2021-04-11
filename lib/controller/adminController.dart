import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/model/modelTamu.dart';
import 'package:guestbook/routes/names.dart';

class AdminController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<ModelTamu> listData = RxList.empty(growable: true);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (FirebaseAuth.instance.currentUser == null) {
      log("message");
      Get.offAndToNamed(Routes.AUTH);
      return;
    }
    listData.bindStream(firestore
        .collection("tamu")
        .orderBy("timestamp", descending: false)
        .snapshots(includeMetadataChanges: true)
        .map((event) => event.docs.map((e) => ModelTamu.fromFirestore(e)).toList()));
  }

  void exit() async {
    try {
      await FirebaseAuth.instance.signOut();
      await Get.offAllNamed(Routes.GUEST);
      return;
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }

  void deleteId(String id) async {
    try {
      await firestore.doc("tamu/$id").delete();
      return;
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }

  void approve(String id) async {
    try {
      await firestore.doc("tamu/$id").update({
        "approve": true,
        "timestamp": Timestamp.now(),
      });
      return;
    } catch (e) {
      Get.defaultDialog(title: "Error", content: Text(e.toString()), confirm: ElevatedButton(onPressed: Get.back, child: Text("Ok")));
      return;
    }
  }
}
