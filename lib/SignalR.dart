import 'package:flutter/material.dart';
import 'package:hello_world/views/pages/chatPage.dart';

const kChatServerUrl = "http://localhost:5001";

class SignalR extends StatelessWidget {

  SignalR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
      home: ChatPage(),
    );
  }
}