import 'package:flutter/material.dart';

class ChatTxt extends StatefulWidget {
  const ChatTxt({Key? key}) : super(key: key);

  @override
  State<ChatTxt> createState() => _ChatTxtState();
}

class _ChatTxtState extends State<ChatTxt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
