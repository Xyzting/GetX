import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final className = "KELAS".obs;

  TextEditingController namacontroller = TextEditingController();
  TextEditingController kelas = TextEditingController();
  TextEditingController namaMapel = TextEditingController();
  TextEditingController jnsMapel = TextEditingController();

  RxList<String> ListSiswa = RxList<String>([]);
  RxMap<String, String> ListMapel = RxMap<String, String>();
//Reactive state
  // RxString nama = RxString('');
  // Rx<String> nama = Rx<String>('');
  // final nama = ''.obs;

  // void ChangeName(String nm) {
  //   nama.value = nm;
  //   print(nama.value);
  //   Get.snackbar('nilai dari variabel nama adalah:', nama.value,
  //       snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
  // }

//simple state
  String nama = '';

  void changeClass(String name){
    className.value = name;
  }

  void addListSiswa(String name){
    ListSiswa.add(name);
  }

  void gantiNilai(String nm) {
    nama = nm;
    update();
  }

  RxBool isOpen = RxBool(true);

  void setIsOpen(bool Open) {
    isOpen(Open);
  }

  RxInt x = 0.obs;

  void increaseX(){
    x.value++;
  }

  void decreaseX(){
    x.value--;
  }

   void addMapel(String namaMapel, String jnsMapel){
    ListMapel[namaMapel] = jnsMapel;
  }
}
