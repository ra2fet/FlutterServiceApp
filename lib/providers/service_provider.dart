import 'package:get/get.dart';

import '../models/service.dart';

class ServiceProvider extends GetConnect {
  Future<List<Datum>> getService() async {
    List<Datum> list = [];
    final response =
        await get("http://taknikat.com/api/categories?type=services");
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      var result = response.body['data'];
      for (var item in result) {
        list.add(Datum.fromJson(item));
      }

      return result;
    }
  }
}
