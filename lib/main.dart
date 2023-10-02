import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/containers/changeClass.dart';
import 'package:getx_project/containers/homePage.dart';
import 'package:getx_project/containers/list_screen.dart';
import 'package:getx_project/containers/matPel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => const MyApp()),
        GetPage(name: "/class", page: () => const ClassScreen()),
        GetPage(name: "/list-siswa", page: () => const ListScreen()),
        GetPage(name: "/list-matpel", page: () => const MapelPage()),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}
