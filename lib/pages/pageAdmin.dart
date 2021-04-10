import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/controller/adminController.dart';

class PageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(),
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text("Dashboard"),
            ),
          ],
        ),
      ),
      body: Container(
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
