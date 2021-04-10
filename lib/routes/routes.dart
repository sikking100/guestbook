import 'package:get/route_manager.dart';
import 'package:guestbook/pages/pageAdmin.dart';
import 'package:guestbook/pages/pageAuth.dart';
import 'package:guestbook/pages/pageGuest.dart';
import 'package:guestbook/pages/pageReceptionist.dart';
import 'package:guestbook/routes/names.dart';

class Pages {
  static List<GetPage> getPage = [
    GetPage(name: Routes.ADMIN, page: () => PageAdmin()),
    GetPage(name: Routes.GUEST, page: () => PageGuest()),
    GetPage(name: Routes.AUTH, page: () => PageAuth()),
    GetPage(name: Routes.RECEPTIONIST, page: () => PageReceptionist()),
  ];
}
