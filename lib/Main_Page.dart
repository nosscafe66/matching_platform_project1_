import 'package:flutter/material.dart';
import 'package:matching_platform_project1/pages/root_app.dart';
import 'package:matching_platform_project1/profile_card_list.dart';
//メインページ(リスト)
//参考URL：https://4qualia.co.jp/technology/solution_business/20210816133245.html
class MainPage extends StatelessWidget {
  var list = ['探す','マッチングした人','お気に入り','歳の差恋愛コラム','割引券一覧','歳の差カップル一覧','連携アプリ一覧','設定'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('マイページ'),
      ),
      body: Container(
        color:Colors.pink.shade100,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
              children: <Widget>[
          //メインページのループ処理
          for(int i = 0; i < 8; i++)...{
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              elevation: 10,
              shadowColor: Colors.red
              ),
                onPressed: (){
              // //ボタン押した時の処理(登録完了画面 + insert文の実行)
                if(list[i] == '探す'){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                    ));
                }
                else if(list[i] == 'マッチングした人'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == 'お気にり'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == '歳の差恋愛コラム'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == '割引券一覧'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == '歳の差カップル一覧'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == '連携アプリ一覧'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
                else if(list[i] == '設定'){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RootApp(),
                        //fullscreenDialog: true),
                      ));
                }
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FourPage(),
              //       fullscreenDialog: true),
              // );
              },child: Text(list[i]),
            ),
          )
        }
          ],
        ),
      ),
    ),
    );
  }
}