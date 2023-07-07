import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_test/app/pages/DetailPage/controller/detail_controller.dart';
import 'package:practical_test/app/pages/home/controller/home_controller.dart';

class DetailPage extends GetView<DetailController> {
  DetailPage({super.key});
  final homeCtr = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CarouselSlider(
          options: CarouselOptions(
            height: Get.height,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2 / 9,
            enableInfiniteScroll: true,
          ),
          items: controller.moProductModel.images!
              .map((item) => SizedBox(
                    child: Center(
                        child: Image.network(item,
                            fit: BoxFit.cover, width: 1000)),
                  ))
              .toList(),
        ),
      ),
      /*ListView.builder(
          itemCount: controller.moProductModel.images!.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              child: Image.network(
                controller.moProductModel.images![index],
                fit: BoxFit.fitHeight,
              ),
            );
          }),*/
    );
  }
}
