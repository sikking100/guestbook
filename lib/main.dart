import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guestbook/routes/names.dart';
import 'package:guestbook/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buku Tamu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.GUEST,
      getPages: Pages.getPage,
    );
  }
}
