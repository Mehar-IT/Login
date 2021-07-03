import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback reset;

  HomePage({Key? key, required this.reset}) : super(key: key);

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
      body: Container(),
    );
  }
}
