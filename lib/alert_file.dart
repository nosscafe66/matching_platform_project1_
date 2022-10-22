import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
CupertinoAlertDialog _alertBuilderForCupertino( BuildContext context, String msg ) {

  return CupertinoAlertDialog(
    title: const Text('My App (like iOS)'),
    content: Text(msg),
    actions: [
      CupertinoDialogAction(child: const Text('OK'), onPressed: () {
        Navigator.pop(context);
      },)
    ],
  );
}