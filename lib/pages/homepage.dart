import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/main.dart';

class HomePage extends StatelessWidget {
  final VoidCallback reset;
  final ValueGetter image;
  final String email;

  HomePage(
      {Key? key, required this.email, required this.reset, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              reset();
              Get.offAll(() => MyHome());
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Text('HomePage'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('We are welcomming you!!!', textScaleFactor: 2.5),
              SizedBox(height: 50),
              ClipOval(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/unknown.png',
                  image: image(),
                  height: 225,
                  width: 225,
                ),
              ),
              SizedBox(height: 50),
              Text(
                '$email',
                textScaleFactor: 2.0,
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
