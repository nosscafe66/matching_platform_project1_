import 'package:flutter/material.dart';
import 'package:matching_platform_project1/gaple_chatroom.dart';
import 'package:matching_platform_project1/pages/root_app.dart';
import 'package:matching_platform_project1/profile_card_list.dart';
import 'package:matching_platform_project1/gaple_chatlist.dart';
import 'package:matching_platform_project1/make_profile.dart';
import 'package:matching_platform_project1/modeldefine/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:matching_platform_project1/mypage/my_page.dart';
import 'package:matching_platform_project1/view_profile/view_profile.dart';


//メインページ(リスト)
//参考URL：https://4qualia.co.jp/technology/solution_business/20210816133245.html
class MainPage extends StatelessWidget {
  MainPage(this.userName,this.uid);

  String userName;
  String uid;
  var list = [
    '探す',
    'マッチングした人',
    'チャット画面',
    '歳の差恋愛コラム',
    '割引券一覧',
    '歳の差カップル一覧',
    'プロフィール作成',
    '設定'
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileModel>(
      create: (_) => ProfileModel()..loginuser(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('マイページ'),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView(
              children: <Widget>[
                //メインページのループ処理
                for (int i = 0; i < 8; i++) ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          //elevation: 10,
                          shadowColor: Colors.black),
                      onPressed: () {
                        // //ボタン押した時の処理(登録完了画面 + insert文の実行)
                        if (list[i] == '探す') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewProfile(),
                                //fullscreenDialog: true),
                              ));
                        }
                        //ここにいったんチャット昨日を追加する。マッチングした人からチャットのルームに遷移できるように紐づける。
                        else if (list[i] == 'マッチングした人') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chatlist(),
                                //チャットリストの中からチャットルームへ移動可能になる。
                              ));
                        } else if (list[i] == 'チャット画面') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(userName),
                                //fullscreenDialog: true),
                              ));
                        } else if (list[i] == '歳の差恋愛コラム') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootApp(),
                                //fullscreenDialog: true),
                              ));
                        } else if (list[i] == '割引券一覧') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootApp(),
                                //fullscreenDialog: true),
                              ));
                        } else if (list[i] == '歳の差カップル一覧') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootApp(),
                                //fullscreenDialog: true),
                              ));
                        } else if (list[i] == 'プロフィール作成') {//連携アプリ一覧
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyPage(),//MyProfile(uid)
                                //fullscreenDialog: true),
                              ));
                        } else if (list[i] == '設定') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RootApp(),
                                //fullscreenDialog: true),
                              ));
                        }
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => FourPage(),
                        //       fullscreenDialog: true),
                        // );
                      },
                      child: Center(
                          child: Text(
                        list[i],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0,
                        ),
                      )),
                    ),
                  )
                }
              ],
            ),
          ),
        ),
      )
    );
  }
}

//プロフィールモデル取得処理モデル
class ProfileModel extends ChangeNotifier{
  final _userCollection = FirebaseFirestore .instance.collection('users');

  List<Profile> users;
  //メインページの操作しているユーザ名を取得する処理
  void loginuser() async {
    final QuerySnapshot snapshot = await _userCollection.get();
    final List<Profile> users = snapshot.docs.map((DocumentSnapshot document){
      Map<String,dynamic> data = document.data() as Map<String,dynamic>;
      final String username = data['username'];
      final String uid = data['uid'];
      return Profile(username,uid);
    }).toList();
    this.users = users;
    notifyListeners();
  }
}