import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/providers/service_provider.dart';

class ServiceController extends GetxController {
  var listService = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;



  @override
  void onInit() async {
    super.onInit();
    // Fetch Data
    getService();


  }

  // Fetch Data
  void getService() {
    try {
      isDataProcessing(true);
      ServiceProvider().getService().then((resp) {
        isDataProcessing(false);
        listService.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      showSnackBar("Exception", exception.toString(), Colors.red);
    }
  }

  // common snack bar
  showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  

 
}
