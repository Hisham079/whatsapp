import 'package:flutter/material.dart';
import 'package:whatsapp/models/call_list.dart';
import 'package:whatsapp/widgets/call_tile.dart';

class callList extends StatefulWidget {
  const callList({Key? key}) : super(key: key);

  @override
  State<callList> createState() => _callListState();
}

class _callListState extends State<callList> {
  List<CallModel> call_List = [
    CallModel(
      avatar:
          "https://i.pinimg.com/736x/b3/4e/3b/b34e3b5c338518b7486d46d88656ca12.jpg",
      name: "Bilal",
      callType: "incoming",
      icon: "Audio",
      callTime: "10:30",
    ),
    CallModel(
      avatar: " ",
      name: "hafis",
      callType: "Out going",
      icon: "Video",
      callTime: "11:30",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: call_List.length,
            itemBuilder: (BuildContext context, int index) {
              return callTile(calls: call_List[index]);
            }));
  }
}
