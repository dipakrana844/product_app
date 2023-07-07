import 'package:get/get.dart';
import 'package:practical_test/app/pages/DetailPage/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}
