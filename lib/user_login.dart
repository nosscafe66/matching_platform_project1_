import 'package:flutter/material.dart';
import 'package:matching_platform_project1/Main_Page.dart';
import 'package:matching_platform_project1/Regist_Failed_Page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:matching_platform_project1/alert_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
//SignUpページ
class LoginPage extends StatelessWidget {
  String userName = '';
  String passWord = '';
  String mailAddress = '';
  String uid = '';
  //セカンドページに値を渡さないとページを作ることができない
  //const SecondPage(this.name);
  //final String name;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Gaple'),
      ),
      body: Container(
        color:Colors.white,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              //color:Colors.black54,
              width:400,
              height:10,
              //child: Center(child: const Text('マイページへログイン')),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1,1),
                    )
                  ]
              ),
            ),
          ),Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              TextFormField(
                onChanged: (username){
                  //ユーザー名の入力
                  userName = username;
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 170,
                  height: 50,
                  //ログイン処理
                  child: OutlinedButton(onPressed: () async {
                    //登録確認画面へ遷移
                    if(mailAddress.isNotEmpty | passWord.isNotEmpty){
                      try{
                          //FirebaseAuthのインスタンスを生成
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          //ToDo
                          final userInfo = await auth.signInWithEmailAndPassword(
                            email: mailAddress,
                            password: passWord,
                          );
                          final currentuser = FirebaseAuth.instance.currentUser;
                          final uid = currentuser.uid;
                          print(currentuser);
                          print(uid);
                      }catch(e){
                        print(e);
                      }
                      //変数が空以外の時に画面遷移を行う
                      //メインページに飛ばす処理及びデータベースとの情報照合確認処理を追加する。
                      //ハッシュ化処理も実装する
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(userName,uid),
                        ),
                      );
                    };
                  },
                      child: Center(
                          child: Text('Login',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4.0,
                            ),))),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}