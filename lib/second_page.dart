import 'package:flutter/material.dart';
import 'package:matching_platform_project1/third_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:matching_platform_project1/alert_file.dart';
//SignUpページ
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('歳の差カップルになりたい人\nなっている人のための\n総合プラットフォーム'),
                TypewriterAnimatedText('今後もたくさん更新していきます。'),
                TypewriterAnimatedText('会員登録どうぞよろしくお願いします。'),
              ],
            ),
          ),
          //画像を表示
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/feet3.jpg',
                fit: BoxFit.contain,
                //画像表示エラー処理
                errorBuilder: (c, o, s) {
                  return const Icon(
                    Icons.error,
                    color: Colors.red,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
                color:Colors.black54,
                width:400,
                height:10,
                //child: Center(child: const Text(''))
            ),
          ),Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextFormField(
                onChanged: (username){
                  //ユーザー名の入力
                  userName = username;
                },
                decoration: const InputDecoration(hintText: "Input Username"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (mailaddress){
                  //メールアドレスの入力
                  mailAddress = mailaddress;
                },
                decoration: const InputDecoration(hintText: "Input Mailaddress"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (password){
                  //パスワードの入力
                  passWord = password;
                },
                decoration: const InputDecoration(hintText: "Input Passoword"),
                obscureText: true, // 追加
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (sex){
                  //性別の入力
                  Sex = sex;
                },
                decoration: const InputDecoration(hintText: "Input Sex"),
                autovalidateMode: AutovalidateMode.onUserInteraction,

              ),
              OutlinedButton(onPressed: (){
                //登録確認画面へ遷移
                if(userName.isNotEmpty | mailAddress.isNotEmpty | passWord.isNotEmpty | Sex.isNotEmpty){
                  //変数が空以外の時に画面遷移を行う
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage(userName,mailAddress,passWord,Sex),
                        fullscreenDialog: true),
                  );
                };
              },
                  child: const Text('新規登録'))
            ]),
          ),
        ]),
      ),
    );
  }
}

// class DatabaseConnection {
//
//   setDatabase() async {
//     var directory = await getApplicationDocumentsDirectory();
//     var path = join(directory.path, 'gaple.db');
//     await deleteDatabase(path);
//
//     var _onConfigure;
//     var database = await openDatabase(path,
//         version: 1, onCreate: _onCreatingDatabase, onConfigure: _onConfigure);
//
//     return database;
//   }
//
//   _onCreatingDatabase(Database database, int version) async {
//     await database.execute('CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
//   }
// }


