import 'package:get/get.dart';

class ServiceProvider extends GetConnect {


  Future<List<dynamic>> getService() async {
    final response = await get("http://taknikat.com/api/categories?type=services");
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {

      var result = response.body['data'];

      
      return result;
    }
  }
}

 