import 'package:flutter/material.dart';
import 'package:whatsapp/screens/call_lScreen.dart';
import 'package:whatsapp/screens/camera.dart';
import 'package:whatsapp/screens/chat_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tb;
  @override
  void initState() {
    super.initState();
    _tb = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'Chat',
            ),
            Tab(
              text: 'Status',
            ),
            Tab(
              text: 'Calls',
            )
          ],
          controller: _tb,
        ),
        title: const Text(
          'Whatsapp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 2, 155, 140),
        actions: [
          const Icon(Icons.search),
          PopupMenuButton(
            itemBuilder: (BuildContext) {
              return [
                const PopupMenuItem(
                  child: Text('New group'),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text('New Broadcast'),
                  value: 2,
                ),
                const PopupMenuItem(
                  child: Text('Linked Device'),
                  value: 3,
                ),
                const PopupMenuItem(
                  child: Text('Starred Messages'),
                  value: 4,
                ),
                const PopupMenuItem(
                  child: Text('Payments'),
                  value: 5,
                ),
                const PopupMenuItem(
                  child: Text('Settings'),
                  value: 6,
                )
              ];
            },
          )
        ],
      ),
      body: TabBarView(
        children:  [
          CameraScreen(),
          chats_list(),
          Text('Status'),
          callList(),
        ],
        controller: _tb,
      ),
    );
  }
}
