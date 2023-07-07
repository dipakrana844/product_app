import 'package:get/get.dart';
import 'package:practical_test/app/pages/DetailPage/binding/detail_binding.dart';
import 'package:practical_test/app/pages/DetailPage/screen/detail_page.dart';
import 'package:practical_test/app/pages/home/binding/home_binding.dart';
import 'package:practical_test/app/pages/home/screen/home_page.dart';
import 'package:practical_test/app/routes/app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.HOME;
  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.DETAIL,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
