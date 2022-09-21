import 'package:flutter/material.dart';

import '../models/message_model.dart';

class ChatBubble extends StatefulWidget {
  @override
  State<ChatBubble> createState() => _ChatBubbleState();
  Message message;

  ChatBubble({required this.message});
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.message.isSent! ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 10, minWidth: 150),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          color: const Color(0xffdcf8c8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 26, top: 5, bottom: 10),
                child: Text(
                  widget.message.message!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 4,
                child: Row(
                  children: [
                    SizedBox(
                      // height: 2,
                      width: 6,
                    ),
                    Text(
                      widget.message.time.toString(),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    widget.message.isReaded! ? Icon(Icons.done_all) : SizedBox()
                  ],
                ),
              )
            ],
          ),
          // elevation: 1,
        ),
      ),
    );
  }
}
