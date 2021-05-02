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
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: b1,
        accentColor: g4,

        // Define the default font family.
        fontFamily: 'Cabin',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
