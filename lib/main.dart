import 'package:chat_app/component/room_name_input.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: InitPage(),
  ));
}

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instant Chat App'),
      ),
      body: Center(
        child: RoomNameInput(onPress: (String text, String sender) {
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
