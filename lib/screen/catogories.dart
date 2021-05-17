import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallx/data/data.dart';
import 'package:wallx/screen/search.dart';

class Cato {
  String types;
  String imgurl;
}

class Catogories extends StatefulWidget {
  Catogories({Key key}) : super(key: key);

  @override
  _CatogoriesState createState() => _CatogoriesState();
}

class _CatogoriesState extends State<Catogories> {
  // ignore: deprecated_member_use
  List<Cato> catogories = new List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Listcato());
  }
}

// ignore: must_be_immutable
class Catlist extends StatelessWidget {
  final String name;
  Image im;
  Catlist({@required this.name, @required this.im});

  @override
  Widget build(BuildContext context) {
    return catoo(context, name, im);
  }

  Widget catoo(BuildContext context, String name, Image im) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Searchwallpaper(
                  starting: name,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: d,
              offset: const Offset(
                0.0,
                20.0,
              ),
              blurRadius: 20.0,
              spreadRadius: -3.0,
            ), //BoxShadow
            //BoxShadow
          ],
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), child: im),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      b.withOpacity(0.85),
                      b1.withOpacity(0.4),
                      d2.withOpacity(0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 27,
              child: Container(
                child: Text(
                  name,
                  style: TextStyle(
                      // fontFamily: 'Architects',
                      fontSize: 30,
                      letterSpacing: 1.5,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
