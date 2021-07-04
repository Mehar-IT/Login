import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/loginData.dart';
import 'package:login/pages/createAccount.dart';
import 'pages/forgotPassword.dart';
import 'pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final controller = Get.put(LoginData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login.png'),
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
            SizedBox(height: 50),
            MaterialButton(
              height: 40,
              minWidth: 140,
              color: Colors.blue,
              onPressed: () {
                _login();
              },
              child: Text(
                'Login',
                textScaleFactor: 1.3,
              ),
            ),
            SizedBox(height: 10),
            MaterialButton(
              height: 40,
              minWidth: 140,
              color: Colors.green,
              onPressed: _createAccount,
              child: Text(
                'Create Account',
                textScaleFactor: 1.3,
              ),
            ),
            TextButton(
              onPressed: _forgot,
              child: Text(
                'forgot Password ?',
                style: TextStyle(color: Colors.red),
                textScaleFactor: 1.3,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      if (controller.password.contains(_passwordController.text) &&
          controller.email.contains(_emailController.text)) {
        Get.to(() => HomePage(
              email: _emailController.text,
              reset: () {
                _formKey.currentState!.reset();
              },
            ));
      } else {
        Get.defaultDialog(
            title: 'Alas!!!!', content: Text('Email/Password is incorrect'));
      }
    }
  }

  void _createAccount() {
    Get.to(() => CreateAccount());
    controller.pass.value = true;
    _formKey.currentState!.reset();
  }

  void _forgot() {
    Get.to(() => ForgotPassword());
    _formKey.currentState!.reset();
  }
}
