import 'package:flutter/material.dart';


class ChatColors {
  static Color userColor(String phone) {
    int value = int.parse(phone.substring(phone.length - 2));
    return _colors[value % _colors.length];
  }

  static List<Color> _colors = [
    Colors.red, //0
    Colors.blue,
    Colors.cyan,
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.indigoAccent,
    Colors.greenAccent, //9
    Colors.lime,
    Colors.amber,
    Colors.brown,
    Colors.indigo,
    Colors.teal,
    Colors.lightBlue,
    Colors.orangeAccent,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.teal[900], //19
    Colors.yellowAccent,
    Colors.deepOrange[900],
    Colors.deepOrangeAccent,
    Colors.deepPurpleAccent,
    Colors.deepPurple[900], //24
    Colors.cyanAccent,
    Colors.yellow[700],
    Colors.yellowAccent[700],
    Colors.pinkAccent[400],
    Colors.redAccent[700] //29
  ];
}