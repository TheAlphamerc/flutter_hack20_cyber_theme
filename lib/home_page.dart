import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hack20_cyber_theme/home_body.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff020c2f),
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        alignment: Alignment.center,
        child: ProgressWidget(),
      ),
    );
  }
}
