import 'package:flutter/material.dart';
import 'package:matching_platform_project1/four_page.dart';
//登録確認ページ
class ThirdPage extends StatelessWidget {
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
        color:Colors.pink.shade100,
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
                  MaterialPageRoute(builder: (context) => FourPage(),
                      fullscreenDialog: true),
                );
                //insert文を実行(会員登録の情報入力)
                //会員情報テーブルとユーザー認証テーブル
              },
                  child: const Text('登録実行')),
            )
          ,]),
        ),
      ),
    );
  }
}