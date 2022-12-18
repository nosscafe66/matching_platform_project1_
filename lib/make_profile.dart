import 'package:flutter/material.dart';
import 'package:matching_platform_project1/Regist_Failed_Page.dart';
import 'package:matching_platform_project1/first_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:matching_platform_project1/alert_file.dart';
import 'package:matching_platform_project1/regist_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_platform_project1/profile_list.dart';
//import 'package:matching_platform_project1/prefecture.dart'
import 'package:image_picker/image_picker.dart';

//プロフィールページように入力値を書き換える。
class MyProfile extends StatelessWidget {
  //プロフィールように変更する。
  String nickname = '';
  String prefecture = '';
  String hobby = '';
  String age = '';
  MyProfile(this.uid);
  String uid;
  final _userCollections = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth auth = FirebaseAuth.instance;
  final currentuser = FirebaseAuth.instance.currentUser;
  List<User> usersinfo;
  final japan = <String>[
    "北海道",
    "青森県",
    "岩手県",
    "宮城県",
    "秋田県",
    "山形県",
    "福島県",
    "茨城県",
    "栃木県",
    "群馬県",
    "埼玉県",
    "千葉県",
    "東京都",
    "神奈川県",
    "新潟県",
    "富山県",
    "石川県",
    "福井県",
    "山梨県",
    "長野県",
    "岐阜県",
    "静岡県",
    "愛知県",
    "三重県",
    "滋賀県",
    "京都府",
    "大阪府",
    "兵庫県",
    "奈良県",
    "和歌山県",
    "鳥取県",
    "島根県",
    "岡山県",
    "広島県",
    "山口県",
    "徳島県",
    "香川県",
    "愛媛県",
    "高知県",
    "福岡県",
    "佐賀県",
    "長崎県",
    "熊本県",
    "大分県",
    "宮崎県",
    "鹿児島県",
    "沖縄県"
  ];
  //セカンドページに値を渡さないとページを作ることができない
  //const SecondPage(this.name);
  //final String name;
  
  final data = ProfileModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>.value(
    //create: (context) => ProfileModel(),
    value: data,
    child: Consumer<ProfileModel>( 
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
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(color: Colors.pinkAccent.shade700)
                        ]),
                  ),
                ),
                Column(
                  children: [
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
                onChanged: (Nickname) {
                  //ユーザー名の入力
                  nickname = Nickname;
                },
                decoration: const InputDecoration(hintText: "Input Nickname"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (Prefecture) {
                  //メールアドレスの入力
                  prefecture = Prefecture;
                },
                decoration:
                    const InputDecoration(hintText: "Input prefecture"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (Hobby) {
                  //パスワードの入力
                  hobby = Hobby;
                },
                decoration: const InputDecoration(hintText: "Input hobby"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                onChanged: (Age) {
                  //性別の入力
                  age = Age;
                },
                decoration: const InputDecoration(hintText: "Input age"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              OutlinedButton(
                  onPressed: () async {
                    if(FirebaseAuth.instance.currentUser != null){
                      print("login");
                      //print(FirebaseAuth.instance.currentUser);
                      //登録確認画面へ遷移
                      // if (nickname.isNotEmpty |
                      //     prefecture.isNotEmpty |
                      //     hobby.isNotEmpty |
                      //     age.isNotEmpty) {
                            try{
                              
                              final QuerySnapshot snapshot = await _userCollections.get();
                              //print(snapshot);
                              final List<User> usersinfo = snapshot.docs.map((DocumentSnapshot document){
                                Map<String, dynamic> data = document.data() as Map<String,dynamic>;
                                //final String email = data['email'];
                                //final String uid = data['uid'];
                              }).toList();
                              // FireStoreに新規登録ユーザーの情報を書き込む
                              final uid = currentuser.uid;
                              final doc = FirebaseFirestore.instance.collection("profiles").doc(uid);
                              await doc.set({
                                "uid":uid,
                                "nickname":nickname,
                                "prefecture": prefecture,
                                "hobby": hobby,
                                "age": age,
                              });
                              await Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                    //ユーザー登録に成功した場合には最初のページに戻る。
                                    return FirstPage();
                          }),);
                            } catch(e){
                              print("error");
                              print(e);
                            }
                        //変数が空以外の時に画面遷移を行う
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ThirdPage(nickname, prefecture, hobby, age),
                              fullscreenDialog: true),
                        );
                      //};

                    }else{
                      //print(FirebaseAuth.instance.currentUser);
                      print("nologin");
                    }
                  },
                  child: Center(
                      child: const Text(
                    'ProfileRegister Check',
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