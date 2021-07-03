import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback reset;
  final String email;

  HomePage({Key? key, required this.email, required this.reset})
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
              Navigator.pop(context);
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
              Text('We are welcomming you!!!', textScaleFactor: 1.5),
              Text(
                '$email',
                textScaleFactor: 1.5,
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
