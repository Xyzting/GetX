import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController namacontroller = TextEditingController();
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
}
