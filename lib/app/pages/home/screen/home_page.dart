import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_test/app/pages/home/controller/home_controller.dart';
import 'package:practical_test/app/routes/app_routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return controller.mbCheck.value
              ? ListView.builder(
                  controller: controller.moScrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.moProductModel.products!.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == controller.moProductModel.products!.length) {
                      return const CupertinoActivityIndicator();
                    }
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.DETAIL,
                            arguments: controller
                                .moProductModel.products![index]
                                .toJson());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.2,
                                  child: Image.network(
                                    controller.moProductModel.products![index]
                                        .thumbnail
                                        .toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.moProductModel
                                            .products![index].title
                                            .toString(),
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        controller.moProductModel
                                            .products![index].price
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        }));
  }
}
