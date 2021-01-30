import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/service_controller.dart';
import 'package:service_app/pages/subdetail.dart';

class DetailView extends GetView<ServiceController> {
  final int id;
  final String title;

  DetailView(this.title, this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isDataProcessing.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (controller.listService[id]["categories"].length > 0) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.listService[id]["categories"].length,
              itemBuilder: (BuildContext context, int index) {
                return serviceDetailItem(index);
              },
            );
          }
        }
      }),
    );
  }

  Widget serviceDetailItem(int index) {
    return InkWell(
      onTap: () => Get.to(SubDetailView(
          controller.listService[id]["categories"][index]['name'], id, index)),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: Container(
          height: 200,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  width: 200,
                  child: controller.listService[id]["categories"][index]
                          ['image']
                      ? Image.network(
                          controller.listService[id]["categories"][index]
                              ['image'],
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey,
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),
                ),
                Text(
                  controller.listService[id]["categories"][index]['name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
