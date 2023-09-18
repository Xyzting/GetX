import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/indec');
                          },
                          child: const Text('Increase/Decrease')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/listsc');
                          },
                          child: const Text('List Screen'))
                    ],
                  ),
                ));
              },
              icon: const Icon(Icons.edit_note_outlined))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: hc.namacontroller,
              decoration: const InputDecoration(
                hintText: "Nama Anda",
                labelText: "Nama",
              ),
              onSubmitted: (value) {
                hc.gantiNilai(hc.namacontroller.text);
                // Get.defaultDialog(
                //     title: "Nama yang diinput",
                //     middleText: hc.namacontroller.text,`
                //     onConfirm: () {
                //       Get.to(SecondScreen(), arguments: hc.namacontroller.text);
                //     });
                Get.snackbar(
                    'nilai dari variabel nama adalah:', hc.namacontroller.text,
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 3));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Obx(() => Text(hc.nama.value)),
            GetBuilder<HomeController>(builder: (hc) {
              return Text(hc.nama);
            }),
            Obx(() => Row(
                  children: [
                    Text(hc.isOpen.value ? 'Open' : 'Close'),
                    const Spacer(),
                    Switch(
                        value: hc.isOpen.value,
                        inactiveThumbColor: Colors.red,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          hc.setIsOpen(value);
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
