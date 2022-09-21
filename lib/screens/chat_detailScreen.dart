import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/User.dart';
import 'package:whatsapp/widgets/chat_bubble.dart';

import '../models/message_model.dart';

class chatDetails extends StatefulWidget {
  chatDetails({
    Key? key,
    required this.details,
  }) : super(key: key);
  User details;
  TextEditingController _msg_ctlr = TextEditingController();

  @override
  State<chatDetails> createState() => _chatDetailsState();
}

class _chatDetailsState extends State<chatDetails> {
  bool show_send = false;
  bool show_emoji = false;
  FocusNode focusNode = FocusNode();
  List<Message> message_list = [
    Message(isSent: true, message: 'hi', time: '12:43', isReaded: true),
    Message(isSent: false, message: 'hello', time: '12:43', isReaded: false),
    Message(
        isSent: true, message: 'How are you', time: '12:43', isReaded: true),
    Message(isSent: false, message: 'fine', time: '12:43', isReaded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 155, 140),
        leadingWidth: 80,
        titleSpacing: 2,
        leading: Row(
          children: [
            GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(
              width: 3,
            ),
            // IconButton(
            //     onPressed: () => Navigator.pop(context),
            //     icon: Icon(Icons.arrow_back)),
            const CircleAvatar(
              child: Text('h'),
              radius: 22,
            ),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.details.name.toString()),
            Text(
              'last seen ${widget.details.updatedAt.toString()}',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.video_call_rounded),
          SizedBox(
            width: 12,
          ),
          const Icon(Icons.call),
          PopupMenuButton(itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text('View contact'),
              ),
              PopupMenuItem(
                child: Text('Media,links,and docs'),
              ),
              PopupMenuItem(
                child: Text('Search'),
              ),
              PopupMenuItem(
                child: Text('Mute notifications'),
              ),
              PopupMenuItem(
                child: Text('Disappearing messages'),
              ),
              PopupMenuItem(
                child: Text('Wallpaper'),
              ),
              PopupMenuItem(
                child: Text('More'),
              ),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg'))),
        child: Stack(children: [
          ListView.builder(
              itemCount: message_list.length,
              itemBuilder: ((context, index) => ChatBubble(
                    message: message_list[index],
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      onTap: () {
                        if (show_emoji) {
                          focusNode.unfocus();
                        }
                        print(show_emoji);
                      },
                      focusNode: focusNode,
                      onChanged: ((value) {
                        print(value.length);
                        if (value.length > 0) {
                          setState(() {
                            show_send = true;
                          });
                        } else {
                          setState(() {
                            show_send = false;
                          });
                        }
                      }),
                      decoration: InputDecoration(
                          prefixIconColor: Colors.grey,
                          suffixIconColor: Colors.grey,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 14),
                          hintText: 'message',
                          icon: IconButton(
                            onPressed: () {
                              focusNode.unfocus();
                              setState(() {
                                show_emoji = !show_emoji;
                              });
                              if (!show_emoji) {
                                focusNode.requestFocus();
                              }
                            },
                            icon: Icon(show_emoji
                                ? Icons.emoji_emotions_outlined
                                : Icons.keyboard),
                          ),
                          suffixIcon: showIcons(show_send)),
                      controller: widget._msg_ctlr,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: InkWell(
                      onTap: () {
                        print(widget._msg_ctlr.text);
                        setState(() {
                          message_list.add(Message(
                              message: widget._msg_ctlr.text,
                              isSent: true,
                              isReaded: false,
                              time: '1:25'));
                        });
                        widget._msg_ctlr.clear();
                        print(message_list);
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(
                          0xFF075E54,
                        ),
                        child: Icon(show_send ? Icons.send : Icons.mic),
                      ),
                    ),
                  )
                ],
              ),
              show_emoji ? select_emoji() : SizedBox(),
            ],
          ),
        ]),
      ),
    );
  }

  Row showIcons(bool sent) {
    if (sent) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => menu());
              },
              icon: Icon(Icons.attach_file))
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (builder) => menu());
              },
              icon: Icon(Icons.attach_file)),
          Icon(Icons.camera_alt)
        ],
      );
    }
  }

  Container menu() {
    return Container(
      color: Colors.transparent,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  icon_widget(
                      Icon(Icons.insert_drive_file), 'Document', Colors.indigo),
                  icon_widget(Icon(Icons.camera_alt), 'Camera', Colors.pink),
                  icon_widget(
                      Icon(Icons.insert_photo), 'Gallery', Colors.purple),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    icon_widget(Icon(Icons.headset), 'Audio', Colors.orange),
                    icon_widget(Icon(Icons.location_pin), 'Location',
                        Color.fromARGB(255, 11, 89, 32)),
                    icon_widget(Icon(Icons.contact_phone), 'Payment',
                        Color.fromARGB(255, 5, 83, 59)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      height: 300,
    );
  }

  GestureDetector icon_widget(Icon icon, String text, Color color) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: (icon),
            radius: 30,
          ),
          Text(text)
        ],
      ),
    );
  }

  Widget select_emoji() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        widget._msg_ctlr.text = emoji.emoji;
      },
    );
  }
}



// ListView(
          //   children: [
          //     SentMessage(
          //       sentText: 'hello',
          //       sentTime: '10:00 AM',
          //       isread: null,
          //     ),
          //     SentMessage(
          //       sentText: 'hei djfhudfhd djfhhfdhffhdfurhduhe',
          //       sentTime: '12:00 PM',
          //       isread: null,
          //     ),
          //     RecievedMessage(recieve_text: 'ya', recieved_time: '1:48')
          //   ],
          // ),