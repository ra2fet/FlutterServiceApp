import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/service_controller.dart';
import 'package:service_app/pages/detail.dart';

class HomeView extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Text(
          'Created by : Rafat Haroub',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      appBar: AppBar(
        title: Text('Services App'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isDataProcessing.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.listService.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.listService.length,
                    itemBuilder: (BuildContext context, int index) {
                      return serviceItem(index);
                    },
                  )
                : Text("No data found");
      }),
    );
  }

  Widget serviceItem(int index) {
    return InkWell(
      onTap: () => Get.to(DetailView(controller.listService[index])),
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
                  child: controller.listService[index].image.isNotEmpty
                      ? Image.network(
                          controller.listService[index].image,
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
                  controller.listService[index].name,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
