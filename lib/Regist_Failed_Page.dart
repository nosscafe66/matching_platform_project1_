import 'package:flutter/material.dart';
import 'package:matching_platform_project1/four_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_platform_project1/main_model.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:matching_platform_project1/signup/signup_page.dart';

//登録確認ページ(子ウィジェットとして扱うこととする。)
class ThirdPage extends StatelessWidget {
  //会員登録時時に必要な要素一覧
  const ThirdPage(this.userName,this.mailAddress,this.passWord,this.Sex);
  final userName;
  final mailAddress;
  final passWord;
  final Sex;
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
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(userName,
                style: TextStyle(
                backgroundColor: Colors.red.shade100,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.double
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(mailAddress,style: TextStyle(
                backgroundColor: Colors.red.shade100,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.double
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Sex,style: TextStyle(
                backgroundColor: Colors.red.shade100,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.double
              )),
            ),
            Container(
                color:Colors.black54,
                width:400,
                height:10
            ),
            Center(
              child: OutlinedButton(onPressed: (){
                //ボタン押した時の処理(登録完了画面 + insert文の実行)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUPPage(),
                      fullscreenDialog: true),
                );
                //insert文を実行(会員登録の情報入力)
                //会員情報テーブルとユーザー認証テーブル
              },
                  child: const Center(
                      child: const Text('ReturnPage',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                        ),))),
            )
          ,]),
        ),
      ),
    );
  }
}