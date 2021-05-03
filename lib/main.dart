import 'package:flutter/material.dart';
import 'package:wallx/data/data.dart';
import 'package:wallx/screen/home.dart';

void main() {
  runApp(Wallx());
}

class Wallx extends StatelessWidget {
  const Wallx({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: b1,
        accentColor: g4,
        fontFamily: 'Cabin',
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
