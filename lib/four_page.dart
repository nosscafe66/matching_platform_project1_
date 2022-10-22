import 'package:flutter/material.dart';
//登録
class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Test APP')
      ),
      body: Container(
        color:Colors.white,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Center(child: Text('登録完了',
          style: TextStyle(
              backgroundColor: Colors.red.shade100,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              letterSpacing: 4.0,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.double
        ),)),
      ),
    );
  }
}