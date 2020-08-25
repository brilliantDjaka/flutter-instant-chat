import 'package:chat_app/component/chat_bubble.dart';
import 'package:chat_app/component/input_chat.dart';
import 'package:chat_app/states/messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatPage extends StatelessWidget {
  final String sender;
  final String room;
  const ChatPage({Key key, this.sender, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesState(
        room,
      ),
      builder: (context, child) => _ChildPage(
        sender: sender,
        room: room,
      ),
    );
  }
}

class _ChildPage extends StatelessWidget {
  final String sender;
  final String room;
  const _ChildPage({Key key, this.sender, this.room}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    var _messages = Provider.of<MessagesState>(context, listen: false);
    _messages.room = room;
    _messages.sender = sender;
    _messages.setController = _scrollController;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$room room',
            ),
            IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  var _controller = TextEditingController();
                  _controller.text = 'https://brilliantdjaka.github.io/flutter-instant-chat/#/$room';
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('share this link'),
                            TextField(
                              controller: _controller,
                            ),
                          ],
                        ),
                        actions: [
                          RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('close'),
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ));
                })
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Consumer<MessagesState>(builder: (context, value, child) {
            if (value.loadingState == true)
              return Center(
                child: SpinKitFoldingCube(
                  color: Theme.of(context).accentColor,
                  size: 30,
                ),
              );
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

              messages.add(text);
            },
          )
        ],
      ),
    );
  }
}
