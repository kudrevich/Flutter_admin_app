import 'package:flutter/material.dart';

class Message {
  final DateTime time; 
  final String sender; 
  final TypeMessage type;
  final String content;
  final bool status;

  Message({
    @required this.time,
    @required this.sender,
    @required this.type,
    @required this.content,
    this.status = false,
  });
}

enum TypeMessage { text, picture, order, bill }

extension ValueGetter on TypeMessage {
  int get typeIndex => this.index + 1;
}
