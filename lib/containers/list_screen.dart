import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.find();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: hc.namacontroller,
              decoration: const InputDecoration(  
                labelText: "Nama",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (() => hc.addListSiswa(hc.namacontroller.text)), 
              child: const Text("Confirm!")
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: hc.ListSiswa.length,
                  itemBuilder: (context, index) => (
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(hc.ListSiswa.value[index])
                      ],
                    )
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}