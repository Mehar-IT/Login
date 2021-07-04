import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginData extends GetxController {
  RxList<String> email = <String>[].obs;
  RxList<String> password = <String>[].obs;
  RxBool pass = true.obs;

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  _setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('email', email);
    await prefs.setStringList('password', password);
  }

  _getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email.value = prefs.getStringList('email') ?? <String>[];
    password.value = prefs.getStringList('password') ?? <String>[];
  }

  void createAccount(
      {required String userEmail, required String userPassword}) {
    if (email.contains(userEmail)) {
      Get.defaultDialog(title: 'Alas!!!', content: Text('Put Another email'));
    } else {
      email.add(userEmail);
      password.add(userPassword);
      _setData();
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
        content: Text('your password is ${password[email.indexOf(userEmail)]}'),
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
      );
    } else {
      Get.defaultDialog(
          title: 'Error 404',
          content: Text('Sorry no account is avalaible with this name'));
    }
  }

  void deleteAccount(
      {required String userEmail, required String userPassword}) {
    if (email.contains(userEmail) && password.contains(userPassword)) {
      email.removeAt(email.indexOf(userEmail));
      password.removeAt(password.indexOf(userPassword));
      Get.defaultDialog(
        title: 'Congrats',
        content: Text('Your Account successfully deleted'),
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
      );
    } else {
      Get.defaultDialog(
          title: 'Error 404', content: Text('This email is not found'));
    }
  }
}
