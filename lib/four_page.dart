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
        child: Center(child: Text('Registed',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
        ),)),
      ),
    );
  }
}