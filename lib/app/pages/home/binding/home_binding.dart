import 'package:get/get.dart';
import 'package:practical_test/app/pages/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
