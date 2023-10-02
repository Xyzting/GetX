import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/home_controller.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController ic = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mapel'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
        children: [
          TextField(
            controller: ic.namaMapel,
            decoration: InputDecoration(labelText: 'Input Kode Mapel'),
          ),
          TextField(
            controller: ic.jnsMapel,
            decoration: InputDecoration(labelText: 'Input Nama Mapel'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ic.addMapel(ic.namaMapel.text, ic.jnsMapel.text);
              },
              child: Text('Submit')),
          Expanded(
            child: Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: ic.ListMapel.length,
              itemBuilder: (context, index) {
                String key = ic.ListMapel.keys.elementAt(index);
                return ListTile(
                  leading: Text('${key}'),
                  trailing: Text('${ic.ListMapel[key]}'),
                );
              },
            )))
        ],
      )),
    );
  }
}