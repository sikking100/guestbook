import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/controller/guestController.dart';

class PageGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GuestController());

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              height: Get.height - 500,
            ),
            SizedBox(height: 10),
            Text("Selamat Datang", style: Get.textTheme.headline3),
            Text("Silakan masukkan data diri", style: Get.textTheme.headline4),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nama",
                      ),
                      controller: controller.nama,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "No. Hp",
                      ),
                      controller: controller.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "No. Hp tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      controller: controller.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }

                        if (!GetUtils.isEmail(value)) {
                          return "Masukkan email yang benar";
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Keperluan",
                      ),
                      controller: controller.keperluan,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email tidak boleh kosong";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(onPressed: controller.onRegister, icon: Icon(Icons.login), label: Text("Register"))
          ],
        ),
      ),
    );
  }
}
