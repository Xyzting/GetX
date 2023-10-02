import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.find();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: hc.kelas,
              decoration: const InputDecoration(  
                labelText: "Class Name",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
               hc.changeClass(hc.kelas.text);
              }, 
              child: const Text("Confirm!")
            ),
            const SizedBox(
              height: 20,
            ),
              Obx( 
              () => Text(
                hc.className.value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}