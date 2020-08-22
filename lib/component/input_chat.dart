import 'package:flutter/material.dart';

class InputChat extends StatelessWidget {
  final void Function(String text) onPress;
  final TextEditingController _controller = TextEditingController();
  InputChat({Key key, @required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();
    return Row(
      children: [
        Expanded(
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black38,
              ),
              child: TextField(
                focusNode: focusNode,
                onSubmitted: (value) {
                  onPress(_controller.text);
                  _controller.clear();
                  focusNode.requestFocus();
                },
                controller: _controller,
                decoration: InputDecoration.collapsed(
                  hintText: null,
                ),
              )),
        ),
        IconButton(
            icon: Icon(
              Icons.send,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              onPress(_controller.text);
              _controller.clear();
            })
      ],
    );
  }
}
