// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/models/call_list.dart';
import 'package:whatsapp/screens/call_lScreen.dart';

class callTile extends StatefulWidget {
  CallModel calls;
  callTile({required this.calls});

  @override
  State<callTile> createState() => _callTileState();
}

class _callTileState extends State<callTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          widget.calls.name.toString(),
        ),
        subtitle: Row(
          children: [
            widget.calls.callType == 'Out going'
                ? Icon(
                    Icons.call_made_outlined,
                    color: Colors.blue,
                  )
                : widget.calls.callType == 'incoming'
                    ? Icon(
                        Icons.call_made_outlined,
                        color: Color.fromARGB(255, 237, 13, 17),
                      )
                    : Text(widget.calls.callType.toString()),
            Text(widget.calls.callTime.toString())
          ],
        ),
        leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.calls.avatar.toString())),
        trailing: widget.calls.icon == 'Audio'
            ? Icon(Icons.call)
            : Icon(Icons.videocam));
  }
}
