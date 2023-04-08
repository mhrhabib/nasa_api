import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_app/bindings/all_bindings.dart';
import 'package:nasa_app/screens/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AllBindings(),
      home:  MyHomePage(),
    );
  }
}

