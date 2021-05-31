import 'package:admin_app/ui/authorisation_page/authorisation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealTime',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.red,
        accentColor: Colors.amber,
        cardColor: Color(0xFFF5F7FE),
      ),
      home: AuthorisationPage()
    );
  }
}
