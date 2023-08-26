import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_app/bindings/home_bindings.dart';
import 'package:service_app/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home',
            page: () => HomeView(),
            binding: HomeBinding(),
            curve: Curves.elasticIn),
      ],
    );
  }
}
