import 'package:employee_list_scroll/bindings/app_bindings.dart';
import 'package:employee_list_scroll/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      initialBinding: AppBindings(),
    );
  }
}
