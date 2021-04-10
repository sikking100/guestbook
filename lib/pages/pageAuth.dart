import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/controller/authController.dart';

class PageAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 200),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login", style: Get.textTheme.headline3),
            SizedBox(height: 10),
            TextField(
              controller: controller.email,
              decoration: InputDecoration(labelText: "email"),
            ),
            TextField(
              controller: controller.password,
              decoration: InputDecoration(labelText: "password"),
              obscureText: true,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.arrow_back), label: Text("Kembali")),
                ElevatedButton.icon(onPressed: controller.onLogin, icon: Icon(Icons.login), label: Text("Login")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
