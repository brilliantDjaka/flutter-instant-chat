import 'package:flutter/material.dart';

class RoomNameInput extends StatelessWidget {
  final TextEditingController _controllerRoom = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final void Function(String text, String sender) onPress;
  final _formKey = GlobalKey<FormState>();
  RoomNameInput({Key key, @required this.onPress, String room})
      : super(key: key) {
    _controllerRoom.text = room;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width < 340) ? double.infinity : 341,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Input room name / Create a new one'),
            TextFormField(
              validator: (value) {
                if (value.isEmpty)
                  _controllerRoom.text = 'default';
                else if (value.contains(' '))
                  return 'instead space please use "-"';
                return null;
              },
              decoration: InputDecoration(
                  hintText: 'blank field will enter default room'),
              controller: _controllerRoom,
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text('Username'),
            TextFormField(
              controller: _controllerName,
              validator: (value) {
                if (value.isEmpty) return 'username is required';
                return null;
              },
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  if (_formKey.currentState.validate())
                    onPress(_controllerRoom.text, _controllerName.text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
