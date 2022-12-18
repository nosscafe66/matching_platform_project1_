import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

// 画像を追加
Future onAddPhoto() async {
  // 画像ファイルを選択
  final FilePickerResult result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );

  // 画像ファイルが選択された場合
  if (result != null) {
    // ログイン中のユーザー情報を取得
    final User user = FirebaseAuth.instance.currentUser;

    // フォルダとファイル名を指定し画像ファイルをアップロード
    // 日時をエポックミリ秒に変換
    final int timestamp = DateTime.now().microsecondsSinceEpoch;
    // ファイルのパス
    final File file = File(result.files.single.path);
    // パスを/で区切った最後の値をnameに入れる
    final String name = file.path.split('/').last;
    final String path = '${timestamp}_$name';
    final TaskSnapshot task = await FirebaseStorage.instance
        .ref()
        .child('user/${user.uid}/photos') // フォルダ名
        .child(path) // ファイル名
        .putFile(file); // 画像ファイル
    // アップロードした画像のURLを取得
    final String imageURL = await task.ref.getDownloadURL();
    // アップロードした画像の保存先を取得
    final String imagePath = task.ref.fullPath;
    // データ
    final data = {
      'imageURL': imageURL,
      'imagePath': imagePath,
      'isFavorite': false, // お気に入り登録
      'createdAt': Timestamp.now(), // 現在時刻
    };
    // データをCloud Firestoreに保存
    await FirebaseFirestore.instance
        .collection('users/${user.uid}/photos') // コレクション
        .doc() // ドキュメント（何も指定しない場合は自動的にIDが決まる）
        .set(data); // データ
  }
}