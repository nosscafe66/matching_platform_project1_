import 'package:flutter/material.dart';
import 'package:matching_platform_project1/Regist_Failed_Page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:matching_platform_project1/alert_file.dart';
//SignUpページ
class ProfilePageCard extends StatelessWidget {
  //セカンドページに値を渡さないとページを作ることができない
  //const SecondPage(this.name);
  //final String name;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Test APP'),
      ),
      body: Container(
        color:Colors.pink.shade100,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,

      ),
    );
  }
}