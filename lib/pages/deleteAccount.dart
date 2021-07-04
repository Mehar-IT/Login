import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/loginData.dart';

class DeleteAccount extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final controller = Get.put(LoginData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login3.png'),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is empty';
                        } else if (value.length <= 5) {
                          return 'email length must be greater than 5';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Enter an email',
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => TextFormField(
                          obscureText: controller.pass.value,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is empty';
                            } else if (value.length <= 5) {
                              return 'password length must be greater than 5';
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: Icon(controller.pass.value
                                  ? Icons.security
                                  : Icons.remove_red_eye),
                              onPressed: () {
                                controller.pass.value = !controller.pass.value;
                              },
                            ),
                            hintText: 'Enter an password',
                            labelText: 'Password',
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.deleteAccount(
                      userEmail: _emailController.text,
                      userPassword: _passwordController.text);

                  controller.pass.value = true;
                }
              },
              color: Colors.blue,
              child: Text('Delete Account'),
            ),
            MaterialButton(
              onPressed: () {
                Get.back();
              },
              color: Colors.red,
              child: Text('Cancel'),
            )
          ],
        ),
      ),
    );
  }
}
