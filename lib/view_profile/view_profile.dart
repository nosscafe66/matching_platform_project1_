import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:matching_platform_project1/register_file.dart';
import 'package:matching_platform_project1/view_profile/view_profile_model.dart';

//プロフィールページように入力値を書き換える。
class ViewProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewProfileModel>(
        // createでfetchBooks()も呼び出すようにしておく。
        create: (_) => ViewProfileModel()..fetchprofiles(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('ProfileList'),
            backgroundColor:Colors.black,
          ),
          body: Consumer<ViewProfileModel>(
            builder: (context, model, child) {
              // FirestoreのドキュメントのList booksを取り出す。
              final profiles = model.profiles; 
              return ListView.builder(
                // Listの長さを先ほど取り出したbooksの長さにする。
                itemCount: profiles.length,
                // indexにはListのindexが入る。
                itemBuilder: (context, index) {
                  return ListTile(
                    //　books[index]でList booksのindex番目の要素が取り出せる。
                    title: Text(profiles[index].uid),
                    subtitle: Text(profiles[index].uid),
                    leading:Icon(Icons.account_box_rounded),
                    onTap: () => {},
                    onLongPress: () => {},
                    trailing: Icon(Icons.more_vert),
                  );
                },
              );
            },
          ),
        ),
      );
  }
}