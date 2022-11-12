import 'package:flutter/material.dart';
import 'package:matching_platform_project1/third_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:matching_platform_project1/alert_file.dart';
import 'package:matching_platform_project1/main_model.dart';

//SignUpページ(画面のウィジェット部分)
class SecondPage extends StatelessWidget {
  String userName = '';
  String mailAddress = '';
  String passWord = '';
  String Sex = '';
  //セカンドページに値を渡さないとページを作ることができない
  //const SecondPage(this.name);
  //final String name;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
    create: (context) => SignUpModel(),
    child: Consumer<SignUpModel>( 
      builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Gaple'),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(children: [
          //画像を表示
          Center(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 400,
                    height: 420,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(color: Colors.pinkAccent.shade700)
                        ]),
                  ),
                ),
                Column(
                  children: [
                    for (int i = 0; i < 4; i++) ...{
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(color: Colors.blueAccent.shade400)
                              ]),
                          child: Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border(),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50),
                                ),
                                boxShadow: [
                                  BoxShadow(color: Colors.blueAccent.shade400)
                                ]),
                          ),
                        ),
                      ),
                    },
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              //color: Colors.black54,
              width: 400,
              height: 10,
              //child: Center(child: const Text(''))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextFormField(
                onChanged: (username) {
                  //ユーザー名の入力
                  userName = username;
                },
                decoration: const InputDecoration(hintText: "Input Username"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (mailaddress) {
                  //メールアドレスの入力
                  mailAddress = mailaddress;
                },
                decoration:
                    const InputDecoration(hintText: "Input Mailaddress"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (password) {
                  //パスワードの入力
                  passWord = password;
                },
                decoration: const InputDecoration(hintText: "Input Passoword"),
                obscureText: true, // 追加
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (sex) {
                  //性別の入力
                  Sex = sex;
                },
                decoration: const InputDecoration(hintText: "Input Sex"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              OutlinedButton(
                  onPressed: () {
                    //登録確認画面へ遷移
                    if (userName.isNotEmpty |
                        mailAddress.isNotEmpty |
                        passWord.isNotEmpty |
                        Sex.isNotEmpty) {
                      //変数が空以外の時に画面遷移を行う
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ThirdPage(userName, mailAddress, passWord, Sex),
                            fullscreenDialog: true),
                      );
                    }
                    ;
                  },
                  child: Center(
                      child: const Text(
                    'Register Check',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0,
                    ),
                  )))
            ]),
          ),
        ]),
      ),
    )),
  );}
}