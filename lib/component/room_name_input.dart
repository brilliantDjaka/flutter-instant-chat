import 'package:flutter/material.dart';

class RoomNameInput extends StatelessWidget {
  final TextEditingController _controllerRoom = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final void Function(String text) onPress;
  RoomNameInput({
    Key key,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Input room name / Create a new one'),
          TextField(
            onSubmitted: (_value) => onPress(_controllerRoom.text),
            controller: _controllerRoom,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text('Username'),
          TextField(
            onSubmitted: (_value) => onPress(_controllerName.text),
            controller: _controllerName,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                onPress(_controllerRoom.text);
              },
            ),
          )
        ],
      ),
    );
  }
}
