import 'package:flutter/material.dart';
import 'package:flutter_hack20_cyber_theme/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CyberVerse',
      theme: ThemeData.dark().copyWith(brightness: Brightness.dark),
      home: MyHomePage(title: 'Hack 29 Cyber theme'),
      debugShowCheckedModeBanner: false,
    );
  }
}

