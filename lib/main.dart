import 'package:flutter/material.dart';

//Firstページの内容をインポート
import 'first_page.dart';

//メイン処理
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: FirstPage(),
    );
  }
}


