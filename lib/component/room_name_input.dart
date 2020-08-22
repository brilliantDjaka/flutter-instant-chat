import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomNameInput extends StatelessWidget {
  final TextEditingController _controllerRoom = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final void Function(String text, String sender) onPress;
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
            decoration:
                InputDecoration(hintText: 'blank field will enter default room'),
            controller: _controllerRoom,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text('Username'),
          TextField(
            controller: _controllerName,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_controllerName.text.isEmpty)
                  showDialog(
                      context: context,
                      child: AlertDialog(
                        content: Text('username is required'),
                        actions: [
                          MaterialButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('Okay'),
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ));
                else
                  onPress(_controllerRoom.text, _controllerName.text);
              },
            ),
          )
        ],
      ),
    );
  }
}
