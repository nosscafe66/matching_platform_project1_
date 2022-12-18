import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//プロフィールページように入力値を書き換える。
class ProfileModel extends ChangeNotifier {
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
    final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );
    final user = userCredential.user;
    final uid = user.uid;
    final email = user.email;
    //print(user);
    //print(uid);
    //print(email);
    // FireStoreに新規登録ユーザーの情報を書き込む
    final doc = FirebaseFirestore.instance.collection("users").doc(uid);
    await doc.set({
      "email": email,
      "uid": uid,
      "createAt": Timestamp.now(),
    });
  }
}