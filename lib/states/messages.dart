import 'package:firebase/firebase.dart';
import 'package:flutter/widgets.dart';

class MessageChildSchema {
  String sender;
  String message;
  MessageChildSchema({this.sender, this.message});
}

class MessagesState with ChangeNotifier {
  Map<String, MessageChildSchema> message = {};
  DatabaseReference db;
  ScrollController _scrollController;
  MessagesState() {
    db = database().ref('messages');
    init();
    // db.push(
    //   {
    //     "sender":'tesuto',
    //     "message":'test',
    //   }
    // );
    onAdd();
  }
  @override
  notifyListeners() {
    super.notifyListeners();
    if(_scrollController != null)Future.delayed(Duration(milliseconds: 200)).then((value) => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
  }

  init() {
    db.once('value').then((value) {
      Map data = value.snapshot.toJson();
      if (data.isEmpty) {
        return;
      }
      data.forEach((key, value) {
        print(value);
        message[key] = MessageChildSchema(
            sender: value["sender"], message: value["message"]);
      });
      notifyListeners();
    });
  }

  onAdd() {
    db.onChildAdded.forEach((element) {
      print(element.snapshot.toJson());
      Map data = element.snapshot.toJson();
      message[element.snapshot.key] = MessageChildSchema(
        sender: data["sender"],
        message: data["message"],
      );
      notifyListeners();
    });
  }

  set setController(ScrollController scrollController) =>
      _scrollController = scrollController;

  add(String sender, String text) {
    db.push({"sender": sender, "message": text});
  }
}
