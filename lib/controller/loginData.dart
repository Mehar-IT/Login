import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginData extends GetxController {
  RxList<String> email = <String>[].obs;
  RxList<String> password = <String>[].obs;
  RxBool pass = true.obs;

  void createAccount(
      {required String userEmail, required String userPassword}) {
    if (email.contains(userEmail)) {
      Get.defaultDialog(title: 'Alas!!!', content: Text('Put Another email'));
    } else {
      email.add(userEmail);
      password.add(userPassword);

      Get.defaultDialog(
          actions: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)),
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: Text('Ok'),
              color: Colors.blue,
            )
          ],
          title: 'Congrats!!!',
          content: Text('you have successfully created an account'));
    }
  }

  void forgotPassword({required String userEmail}) {
    if (email.contains(userEmail)) {
      Get.defaultDialog(
          title: 'Password',
          content:
              Text('your password is ${password[email.indexOf(userEmail)]}'));
    } else {
      Get.defaultDialog(
          title: 'Error 404',
          content: Text('Sorry no account is avalaible with this name'));
    }
  }
}
