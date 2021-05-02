import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  Fav({Key key}) : super(key: key);

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}
