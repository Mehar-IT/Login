import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: MyLoginPage(),
    );
  }
}
