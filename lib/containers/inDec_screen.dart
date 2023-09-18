import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/home_controller.dart';

class InDecScreen extends StatelessWidget {
  const InDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController ic = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increase/Decrease'),
      ),
      body: Center(
        child: Row(
          children: [
            IconButton(onPressed: (){ic.increaseX();}, icon: const Icon(Icons.add)),
            const Spacer(),
            Obx(() => Text(ic.x.toString())),
            const Spacer(),
            IconButton(onPressed: (){ic.decreaseX();}, icon: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}