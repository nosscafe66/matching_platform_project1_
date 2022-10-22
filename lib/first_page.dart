import 'package:flutter/material.dart';
import 'package:matching_platform_project1/Main_Page.dart';
import 'package:matching_platform_project1/second_page.dart';
import 'package:matching_platform_project1/user_login.dart';
class FirstPage extends StatelessWidget {
  //変数初期化処理
  String nameText = '';
  var Buttonlist = ['SignUp','Login','ImageView','Settings'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Test APP'),
      ),
      body: Container(
        color:Colors.blue.shade100,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width:400,
                height:40,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: const Text('Home'))
            ),
          ),Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                children: [
                  //ボタンのループ処理
                  for(int h = 0; h < 4; h++)...{
                    Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                        child: ElevatedButton(
                            onPressed: (){
                              //ボタンを押したときに呼ばれる処理制御
                              if(h == 0){
                                Navigator.push(
                                    context,
                                    //サインアップ画面
                                    MaterialPageRoute(builder: (context) => SecondPage(),
                                    ));
                              }
                              else if(h == 1){
                                Navigator.push(
                                    context,
                                    //ログイン画面
                                    MaterialPageRoute(builder: (context) => LoginPage(),
                                    ));
                              }
                              else if(h == 2){
                                Navigator.push(
                                    context,
                                    //変更中
                                    MaterialPageRoute(builder: (context) => LoginPage(),
                                    ));
                              }
                              else if(h == 3){
                                Navigator.push(
                                    context,
                                    //変更中
                                    MaterialPageRoute(builder: (context) => LoginPage(),
                                    ));
                              }
                              },
                            child: Text(Buttonlist[h])),
                      )
                    }
            ]),
          ),
          Column(
            children: [
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                color: Colors.pinkAccent.shade100,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/handcouple2.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //カラム内のループ処理
                  for (int i = 0; i < 3; i++)...{
                    Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          )
                        ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //行内のループ処理
                          for(int j = 0; j < 3; j++)...{
                            if(j == 2)...{
                              Container(
                                width: 100,
                                height: 90,
                                child:Center(child: Text('${j + i}')),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.pinkAccent.shade200.withOpacity(0.2 * j),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(1,1),
                                      )
                                    ]
                                ),
                              )
                            }else...{
                              Container(
                                width: 100,
                                height: 90,
                                child:Center(child: Text('${j + i}')),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blueAccent.shade700.withOpacity(0.2 * j),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(1,1),
                                      )
                                    ]
                                ),
                              )
                            },
                          }
                        ],),
                    )
                  }
                ],),
            ),],
          )
        ,]),
      ),
    );
  }
}