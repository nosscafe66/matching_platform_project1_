import 'package:matching_platform_project1/edit_profile/edit_profile_page.dart';
import 'package:matching_platform_project1/mypage/my_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:matching_platform_project1/register_file.dart';

class MyPage extends StatelessWidget {
  Image image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (_) => MyModel()..fetchUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('マイページ'),
          backgroundColor: Colors.black,
          actions: [
            Consumer<MyModel>(builder: (context, model, child) {
              return IconButton(
                onPressed: () async {
                  // 画面遷移
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage(model.name, model.description),
                    ),
                  );
                  model.fetchUser();
                },
                icon: Icon(Icons.edit),
              );
            }),
          ],
        ),
        body: Center(
          child: Consumer<MyModel>(builder: (context, model, child) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width:400,
                        height:50,
                        child:Text(
                        "LoginUsername:${model.name}" ?? '名前なし',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )),Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              width: 400,
                              height: 200,
                          child: image ?? Container(
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(color: Colors.blueAccent.shade700)
                              ]),
                                  )
                                     ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              Image image = await onAddPhoto();
                              //Image image = await getPictureImage();
                            },
                            child: Text("Get Picure"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              onPrimary: Colors.white,
                            ),
                          ),
                        ]
                      ),
                      Text(model.email ?? 'メールアドレスなし'),
                      Text(model.uid ?? 'UIDなし'),
                      Container(
                        width:400,
                        height:400,
                        alignment: Alignment(0.0, 0.0),
                        decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border(),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(color: Colors.blueAccent.shade200)
                              ]),
                        child:Text(
                        model.description ?? '自己紹介なし',
                      )),
                      OutlinedButton(
                        onPressed: () async {
                          // ログアウト
                          await model.logout();
                          Navigator.of(context).pop();
                        },
                        child: Text('Logout'),
                      )
                    ],
                  ),
                ),
                if (model.isLoading)
                  Container(
                    color: Colors.black54,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}