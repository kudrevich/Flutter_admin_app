import 'package:admin_app/ui/chat/widgets/appbar_chat.dart';
import 'package:admin_app/ui/chat/widgets/list_of_messages_and_navbar_chat.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String id;
  final String phoneNumber;

  const Chat(this.id, this.phoneNumber, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppbarChat(phoneNumber),
              Expanded(
                child: ListOfMessagesAndNavbarChat(id, phoneNumber),
                flex: 89,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
