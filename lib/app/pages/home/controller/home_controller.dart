import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:practical_test/app/pages/home/model/product_model.dart';

class HomeController extends GetxController {
  Dio dio = Dio();
  RxBool mbCheck = false.obs;
  late ProductModel moProductModel;
  static String baseUrl = "https://dummyjson.com/products?";
  ScrollController moScrollController = ScrollController();
  int limit = 10;
  int skip = 0;
  RxBool mbIsLoadingMore = false.obs;
  @override
  void onInit() {
    super.onInit();
    moScrollController.addListener(scrollListener);
    getData(limit, skip);
  }

  Future<void> scrollListener() async {
    if (mbIsLoadingMore.value) return;
    if (moScrollController.position.pixels ==
        moScrollController.position.maxScrollExtent) {
      update();
      mbIsLoadingMore.value = true;
      limit = limit + 5;
      skip = skip + 1;
      await getData(limit, skip);
      debugPrint("moScrollController limit > $limit -> $skip");
      mbIsLoadingMore.value = false;
      update();
    }
  }

  Future<void> getData(limit, skip) async {
    try {
      debugPrint("getData $baseUrl limit=$limit&skip=$skip");
      final moResponse = await dio.get("${baseUrl}limit=$limit&skip=$skip");
      if (moResponse.statusCode == 200) {
        moProductModel = ProductModel.fromJson(moResponse.data);
        mbCheck.value = true;
        update();
        debugPrint("moProductModel : $moProductModel");
      }
    } catch (e) {
      debugPrint("moProductModel$e");
    }
  }
}
