import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/controllers/service_controller.dart';
import 'package:service_app/models/service.dart';

class SubDetailView extends GetView<ServiceController> {
  final Datum category;
  SubDetailView(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
      ),
      body: Obx(() {
        return category.categories.length > 0
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: category.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return serviceSubDetailItem(index);
                },
              )
            : Text("No data found");
      }),
    );
  }

  Widget serviceSubDetailItem(int index) {
    return Container(
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
                child: category.categories[index].image.isNotEmpty
                    ? Image.network(
                        category.categories[index].image,
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
                category.categories[index].name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
