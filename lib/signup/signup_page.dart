import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_platform_project1/first_page.dart';
import 'package:matching_platform_project1/Regist_Failed_Page.dart';
import 'package:matching_platform_project1/signup/signup_page_model.dart';

//SignUpページ(画面のウィジェット部分)--これがおそらく親の役割を持つウィジェットになる。
//親Widgetで Provider<T>.value() を使い データを渡す
class SignUPPage extends StatelessWidget {
  bool isLoaded = false;
  String userName = '';
  String mailAddress = '';
  String passWord = '';
  String Sex = '';
  //セカンドページに値を渡さないとページを作ることができない
  //const SecondPage(this.name);
  //final String name;
  
  final data = SignUpModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>.value(
    //create: (context) => SignUpModel(),
    value: data,
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (mailaddress) {
                  //メールアドレスの入力
                  mailAddress = mailaddress;
                },
                decoration:
                    const InputDecoration(hintText: "Input Mailaddress"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
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
                  onPressed: () async {
                    //登録確認画面へ遷移
                    if (userName.isNotEmpty |
                        mailAddress.isNotEmpty |
                        passWord.isNotEmpty |
                        Sex.isNotEmpty) {
                          try{
                            //FirebaseAuthのインスタンスを生成
                            final FirebaseAuth auth = FirebaseAuth.instance;

                            //Fire Auth に新規登録ユーザーの情報を書き込む
                            final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                              email: mailAddress,
                              password: passWord,
                            );
                            final user = userCredential.user;
                            final email = user.email;
                            final uid = user.uid;
                            print(email);
                            print(uid);
                            // FireStoreに新規登録ユーザーの情報を書き込む
                            final doc = FirebaseFirestore.instance.collection("users").doc(uid);
                            await doc.set({
                              "uid":uid,
                              "email": email,
                              "createAt": Timestamp.now(),
                            });
                            await Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  //ユーザー登録に成功した場合には最初のページに戻る。
                                  return FirstPage();
                        }),);
                          } catch(e){
                            print(e);
                          }
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