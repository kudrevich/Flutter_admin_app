import 'package:admin_app/classes/message.dart';
import 'package:flutter/foundation.dart';

class ChatData {
  String id;
  String name; 
  String phoneNumber; 
  Message lastMsg;
  ChatData({
    @required this.id,
    @required this.name,
    @required this.phoneNumber,
    @required this.lastMsg,
  });
}
