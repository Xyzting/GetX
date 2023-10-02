import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  height: 120,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/class');
                          },
                          child: const Text('Change Class')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/list-siswa');
                          },
                          child: const Text('List Siswa')),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed('/list-matpel');
                          },
                          child: const Text('List Mata Pelajaran')),
                    ],
                  ),
                ));
              },
              icon: const Icon(Icons.edit_note_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 35,
            width: 1000,
            color: Colors.green,
            child: Center(
              child: Obx(
                () => Text(
                  hc.className.value,
                  style:  const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: 120,
            width: 1000,
            color: Colors.green[300],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Jumlah Siswa : ',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black
                          ),
                        ),
                        Obx( 
                          () => Text(
                            hc.x.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => IconButton(onPressed: hc.x > 34 || hc.isOpen.value == false ? null : (){hc.increaseX();}, icon: const Icon(Icons.add))),
                        Obx(() => IconButton(onPressed: hc.x < 1 || hc.isOpen.value == false ? null : (){hc.decreaseX();}, icon: const Icon(Icons.remove)))
                      ]
                    ),
                  ] 
                ),
                Obx(() => Row(
                  children: [
                    Text(
                      hc.isOpen.value ? 'Open' : 'Close', 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19
                      ),
                    ),
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
          Container(
            height: 35,
            width: 1000,
            color: Colors.green,
            child: const Center(
              child: Text(
                "SISWA",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            width: 1000,
            color: Colors.blue[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Obx(() => ListView.builder(
                    itemCount: hc.ListSiswa.length,
                    itemBuilder: (context, index) => (
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Row(
                              children: [
                                const Icon(FontAwesomeIcons.user, size: 15, ),
                                const SizedBox(
                                  width: 10,
                                ),
                                // ignore: invalid_use_of_protected_member
                                Text(hc.ListSiswa.value[index]),
                              ],
                            )
                          ),
                        ],
                      )
                    ),
                  ),
                              ),
                ),
              ],
            ),
          ),
          Container(
            height: 35,
            width: 1000,
            color: Colors.green,
            child: const Center(
              child: Text(
                "MATA PELAJARAN",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.all(12),
            height: 200,
            width: 1000,
            color: Colors.red[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: hc.ListMapel.length,
                    itemBuilder: (context, index) {
                      String key = hc.ListMapel.keys.elementAt(index);
                      return ListTile(
                        leading: Container(
                          height: 30,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.key, size: 15,),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${key}'),
                            ],
                          )
                        ),
                        trailing: Container(
                          height: 30,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            padding: const EdgeInsets.fromLTRB(15,5,15,5),
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.book, size: 15,),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('${hc.ListMapel[key]}'),
                            ],
                          )
                        ),
                      );
                    },
                  )
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
