import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//このクラスが新規会員登録の状態管理を行う(状態管理としての認証機能)モデルクラスの定義
class SignUpModel extends ChangeNotifier {
  String mail = "";
  String password = "";
 
  //FirebaseAuthのインスタンスを生成
  final FirebaseAuth auth = FirebaseAuth.instance;

 
  Future signup() async {
    print("button");
    if (mail.isEmpty) {
      throw "メールアドレスを入力して下さい";
    }
    if (password.isEmpty) {
      throw "パスワードを入力して下さい";
    }
    //Fire Auth に新規登録ユーザーの情報を書き込む
    final UserCredential user = await auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );
 
    final email = user.user.email;
    // FireStoreに新規登録ユーザーの情報を書き込む
    await FirebaseFirestore.instance.collection("users").add({
      "email": email,
      "password": password,
      "createAt": Timestamp.now(),
    });
  }
}