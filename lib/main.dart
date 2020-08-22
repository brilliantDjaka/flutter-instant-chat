import 'package:chat_app/component/room_name_input.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/states/messages.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:provider/provider.dart';

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
        title: Text('Init Page'),
      ),
      body: Center(
        child: RoomNameInput(onPress: (String text, String sender) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChatPage(
              sender: sender,
              room: text.isEmpty ? 'default' : text,
            );
          }));
        }),
      ),
    );
  }
}
