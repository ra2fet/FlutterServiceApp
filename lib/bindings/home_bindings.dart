import 'package:get/get.dart';
import 'package:service_app/controllers/service_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
  }
}