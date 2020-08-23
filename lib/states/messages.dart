import 'package:firebase/firebase.dart';
import 'package:flutter/widgets.dart';

class MessageChildSchema {
  String sender;
  String message;
  String room;
  MessageChildSchema({this.sender, this.message});
}

class MessagesState with ChangeNotifier {
  String room;
  String sender;
  Map<String, MessageChildSchema> message = {};
  DatabaseReference db;
  ScrollController _scrollController;
  bool _isLoading = true;
  MessagesState(String room) {
    _isLoading = true;
    this.room = room;
    db = database().ref(room);
    _init();
    _onAdd();
  }
  @override
  notifyListeners() {
    super.notifyListeners();
    if (_scrollController != null)
      Future.delayed(Duration(milliseconds: 200)).then((value) =>
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
  }

  _init() {
    db.once('value').then((value) {
      Map data = value.snapshot.toJson();
      if (data == null || data.isEmpty) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      data.forEach((key, value) {
        message[key] = MessageChildSchema(
            sender: value["sender"], message: value["message"]);
      });
      _isLoading = false;
      notifyListeners();
    });
  }

  _onAdd() {
    db.onChildAdded.forEach((element) {
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

  add(String text) {
    db.push({"sender": sender, "message": text});
  }

  bool get loadingState => _isLoading;
}
