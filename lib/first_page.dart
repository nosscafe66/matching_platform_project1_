import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matching_platform_project1/Main_Page.dart';
import 'package:matching_platform_project1/user_login.dart';
import 'package:matching_platform_project1/signup/signup_page.dart';


class FirstPage extends StatelessWidget {
  //変数初期化処理
  String nameText = '';
  var Buttonlist = ['Signup', 'Login'];
  var Textlist = ['G', 'A', 'P', 'L', 'E'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //ボタンのループ処理
                  for (int h = 0; h < 2; h++) ...{
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 170,
                        height: 50,
                        child: OutlinedButton(
                            //ElevatedButton
                            onPressed: () {
                              //ボタンを押したときに呼ばれる処理制御
                              if (h == 0) {
                                Navigator.push(
                                    context,
                                    //サインアップ画面
                                    MaterialPageRoute(
                                      builder: (context) => SignUPPage(),
                                    ));
                              } else if (h == 1) {
                                Navigator.push(
                                    context,
                                    //ログイン画面
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Center(
                                  child: Text(
                                Buttonlist[h],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5.0,
                                ),
                              )),
                            )),
                      ),
                    )
                  }
                ]),
          ),
          Column(
            children: [
              Container(
                width: 400,
                height: 700,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/handcouple2.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //カラム内のループ処理
                    for (int i = 0; i < 1; i++) ...{
                      Container(
                        width: 350,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 2,
                                offset: Offset(1, 1),
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //行内のループ処理
                            for (int j = 0; j < 5; j++) ...{
                              Container(
                                width: 60,
                                height: 90,
                                child: Center(
                                    child: Text(
                                  Textlist[j],
                                  style: GoogleFonts.courgette(//caveat satisfy courgette
                                    color: Colors.orangeAccent.withBlue(155 * j),
                                    fontSize: 60,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 4.0,
                                  ),
                                )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.black.withOpacity(0.2 * j),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                              )
                            }
                          ],
                        ),
                      )
                    }
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
