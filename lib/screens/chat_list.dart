import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/Chat_tile.dart';

import '../models/User.dart';

class chats_list extends StatefulWidget {
  const chats_list({Key? key}) : super(key: key);

  @override
  State<chats_list> createState() => _chats_listState();
}

class _chats_listState extends State<chats_list> {
  List<User> chatlist = [
    User(
        avatar:
            "https://i.pinimg.com/736x/b3/4e/3b/b34e3b5c338518b7486d46d88656ca12.jpg",
        name: 'hisham',
        isGroup: false,
        updatedAt: '10:00am',
        message: 'helloo'),
    User(
        avatar:
            "https://images.unsplash.com/photo-1614680376408-81e91ffe3db7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2hhdHNhcHAlMjBkcHxlbnwwfHwwfHw%3D&w=1000&q=80",
        name: 'hafis',
        isGroup: false,
        updatedAt: '10:00am',
        message: 'ok'),
    User(
        avatar: "",
        name: 'naseeba',
        isGroup: false,
        updatedAt: '12:00am',
        message: 'aa'),
    User(
        avatar: "",
        name: 'flutter',
        isGroup: true,
        updatedAt: '1:00am',
        message: 'aa'),
    User(
        avatar: "",
        name: '8657749337',
        isGroup: false,
        updatedAt: '1:00am',
        message: 'aa'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 2, 155, 140),
          child: SizedBox(height: 90, child: Icon(Icons.chat)),
        ),
        body: ListView.builder(
            itemCount: chatlist.length,
            itemBuilder: (BuildContext context, int intex) {
              return Chat_Tile(data: chatlist[intex]);
            }));
  }
}
