import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/controller/receptionistController.dart';

class PageReceptionist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReceptionistController());
    return Scaffold(
      body: Container(
        child: Obx(() {
          if (controller.tamu.value.approve != null && controller.tamu.value.approve == true) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text("Selamat! Anda sudah disetujui.")),
                SizedBox(height: 20),
                ElevatedButton(onPressed: controller.tinggalkan, child: Text("Tinggalkan lokasi")),
              ],
            );
          }
          if (controller.tamu.value.approve == false) {
            return Center(child: Text("Mohon menunggu. Anda belum disetujui"));
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
