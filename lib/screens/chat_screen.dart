import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: StreamBuilder(
      //   stream: Firestore,
      //   initialData: initialData,
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     return Container(
      //       child: child,
      //     );
      //   },
      // ),
    );
  }
}