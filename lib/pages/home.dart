import 'package:chat_app/component/room_name_input.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String room;

  const HomePage({Key key, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant Chat App'),
      ),
      body: Center(
        child: RoomNameInput(
            room: room != null&&room.isNotEmpty ? room : null,
            onPress: (String text, String sender) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ChatPage(
                  sender: sender,
                  room: text,
                );
              }));
            }),
      ),
    );
  }
}
