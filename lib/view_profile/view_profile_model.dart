import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:matching_platform_project1/view_profile/profile.dart';

class ViewProfileModel extends ChangeNotifier {
  bool isLoading = false;
  Image img;
  // String name;
  // String email;
  // String description;
  // String uid;
  List<Profile> profiles = [];

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }
  
  // //ここをすべてのプロファイル一覧取得処理にする。
  // void fetchUser() async {
  //   //自分がログインしていることも確認する。
  //   final user = FirebaseAuth.instance.currentUser;
  //   this.email = user?.email;

  //   final uid = FirebaseAuth.instance.currentUser.uid;
  //   final snapshot =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   final data = snapshot.data();
  //   //this.name = data['name'];
  //   //this.description = data['description'];
  //   this.uid = data['uid'];

  //   notifyListeners();
  // }

  //全てのプロファイル一覧を取得する。
  Future <void> fetchprofiles() async {
    // Firestoreからコレクション'profiles'(QuerySnapshot)を取得してdocsに代入。
    final docs = await FirebaseFirestore.instance.collection('users').get();
        // getter docs: docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    // map(): Listの各要素をBookに変換
    // toList(): Map()から返ってきたIterable→Listに変換する。
    final profiles = docs.docs
        .map((doc) => Profile(doc)) 
        .toList();
    this.profiles = profiles; 
    notifyListeners(); 
  }
}