import 'package:cloud_firestore/cloud_firestore.dart';
class Profile{
  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  Profile(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールドをこのProfileのフィールドに代入
    //username = doc['username'];
    uid = doc['uid'];
    email = doc['email'];
  }
  // Profileで扱うフィールドを定義しておく。
  //String username;
  String uid;
  String email;
}
