import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String sender;
  final String text;
  const ChatBubble({
    Key key,
    @required this.sender,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
            ),
            child: Column(
              children: [
                Text(
                  '$sender',
                  style: TextStyle(
                      color: Colors.yellowAccent, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.right,
                ),
                Text(
                  '$text',
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
