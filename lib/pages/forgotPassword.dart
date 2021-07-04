import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/loginData.dart';

class ForgotPassword extends StatelessWidget {
  final _emailController = TextEditingController();
  final controller = Get.put(LoginData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Forgot Password'),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/login2.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            height: 50,
            color: Colors.purple,
            onPressed: () {
              controller.forgotPassword(userEmail: _emailController.text);
            },
            child: Text(
              'Send Password',
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
