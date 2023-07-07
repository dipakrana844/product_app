import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:practical_test/app/pages/home/model/product_model.dart';

class DetailController extends GetxController {
  Dio dio = Dio();
  RxBool mbCheck = false.obs;
  late Product moProductModel;

  @override
  void onInit() {
    super.onInit();
    print("hello");
    moProductModel = Product.fromJson(Get.arguments);
  }
}
