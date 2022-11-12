import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

//チャットの一覧
class Chatlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 6,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            for (int peoplecout = 0; peoplecout < 2; peoplecout++) ...{
              const ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
                leading: CircleAvatar(),
                title: Text('Yuto'),
                subtitle: Text('Hello'),
                trailing: Text('3min ago'),
              )
            }
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}
