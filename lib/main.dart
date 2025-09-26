import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_getx/app/modules/home/bindings/home_bindings.dart';
import 'package:todo_getx/app/modules/home/views/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        getPages: [
          GetPage(
              name: '/home', page: () => HomeScreen(), binding: HomeBindings()),
        ]);
  }
}
