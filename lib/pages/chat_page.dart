import 'package:chat_app/component/chat_bubble.dart';
import 'package:chat_app/component/input_chat.dart';
import 'package:chat_app/states/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    var _messages = Provider.of<MessagesState>(context, listen: false);
    _messages.setController = _scrollController;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Page',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Consumer<MessagesState>(builder: (context, value, child) {
            return ListView.builder(
                controller: _scrollController,
                itemCount: value.message.length,
                itemBuilder: (context, index) {
                  var current = value.message.values.elementAt(index);
                  return ChatBubble(
                      sender: current.sender, text: current.message);
                });
          })),
          InputChat(
            onPress: (text) {
              var messages = Provider.of<MessagesState>(context, listen: false);
              print(text);
              messages.add('briaan', text);
            },
          )
        ],
      ),
    );
  }
}
