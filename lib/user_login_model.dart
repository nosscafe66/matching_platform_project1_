import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matching_platform_project1/Main_Page.dart';
import 'package:matching_platform_project1/Regist_Failed_Page.dart';
import 'package:path/path.dart';
class UserLoginModel extends ChangeNotifier {
  String userName = '';
  String passWord = '';
  String mailAddress = '';
  String uid;

  bool isLoading;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> login() async {
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
  }
}