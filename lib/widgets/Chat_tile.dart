import 'package:flutter/material.dart';
import 'package:whatsapp/models/User.dart';
import 'package:whatsapp/screens/chat_detailScreen.dart';

class Chat_Tile extends StatefulWidget {
  Chat_Tile({required this.data});
  User data; // object

  @override
  State<Chat_Tile> createState() => _Chat_TileState();
}

class _Chat_TileState extends State<Chat_Tile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => chatDetails(
              details: widget.data,
            ),
          )),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            widget.data.avatar == ''
                ? widget.data.isGroup == true
                    ? 'https://lh3.googleusercontent.com/ABlX4ekWIQimPjZ1HlsMLYXibPo2xiWnZ2iny1clXQm2IQTcU2RG0-4S1srWsBQmGAo'
                    : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
                : widget.data.avatar.toString(),
          ),
          radius: 30,
        ),
        trailing: Text(widget.data.updatedAt.toString()
        ),
        
        title: Text(
          widget.data.name.toString(),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.done_all,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                widget.data.message.toString(),
              ),
            ),
          ],
        ),
        
      ),
    );
  }
}
