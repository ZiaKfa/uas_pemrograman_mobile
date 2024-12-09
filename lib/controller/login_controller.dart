import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uas_pemrograman_mobile/model/user.dart';

class LoginController extends GetxController {
  var isLogged = false.obs;
  var username = ''.obs;
  final storage = GetStorage();
  
  @override
  void onInit() {
    isLogged.value = storage.read('isLogged') ?? false;
    username.value = storage.read('username') ?? '';
    // auth();
    super.onInit();
  }

  void login(String user, String pass){ 
    var loggedUser = User.getUsers().firstWhereOrNull(
      (u) => u.username == user && u.password == pass
    );
    if(loggedUser != null){
      isLogged.value = true;
      username.value = user;

      storage.write('isLogged', true);
      storage.write('username', user);
      Get.snackbar(
        'Success', 
        'Login successful. Welcome ${loggedUser.username}!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
      Get.offAllNamed('/dashboard');
    } else if (user.isEmpty || pass.isEmpty){
      Get.snackbar('Error', 'Username atau password tidak boleh kosong');
    }
    else {
      Get.snackbar('Error', 'Username atau password salah');
    }
  }

  void logout() {
    storage.remove('isLogged');
    storage.remove('username');
    Get.offAllNamed('/');
  }

  // void auth(){
  //   if (isLogged.value) {
  //     if (Get.currentRoute != '/') {
  //     return;
  //     }
  //     Get.offAllNamed('/dashboard');
  //   } else {
  //     Get.offAllNamed('/');
  //   }
  // }
}