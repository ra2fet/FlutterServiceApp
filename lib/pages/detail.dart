import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/service_controller.dart';
import 'package:service_app/models/service.dart';
import 'package:service_app/pages/subdetail.dart';

class DetailView extends GetView<ServiceController> {
  final Datum service;

  DetailView(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(service.name),
          centerTitle: true,
        ),
        body: service.categories.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: service.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return serviceDetailItem(index);
                },
              )
            : Text("No data found"));
  }

  Widget serviceDetailItem(int index) {
    return InkWell(
      onTap: () => Get.to(SubDetailView(service.categories[index])),
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
                  child: service.categories[index].image.isNotEmpty
                      ? Image.network(
                          service.categories[index].image,
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
                  service.categories[index].name,
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
