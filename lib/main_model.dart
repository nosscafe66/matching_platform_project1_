import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  String text = 'テキスト';

  void changeText() {
    text = 'テキストが変わった';
    notifyListeners();
  }
}