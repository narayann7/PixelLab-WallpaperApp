import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallx/screen/catogories.dart';

String apiKey = "563492ad6f917000010000014f1ba774859d4548a1895d26ca63d94c";

Color d = new Color(0xff121212);
Color d1 = new Color(0xff1E1E1E);
Color d2 = new Color(0xff232323);
Color d3 = new Color(0xff252525);
Color d4 = new Color(0xff272727);
Color d5 = new Color(0xff2C2C2C);
Color d6 = new Color(0xff2E2E2E);
Color d7 = new Color(0xff333333);
Color d8 = new Color(0xff383838);

Color b = new Color(0xff000000);
Color b1 = new Color(0xff121212);

Color g = new Color(0xffFFD700);
Color g1 = new Color(0xffDAA520);
Color g2 = new Color(0xffB8860B);
Color g3 = new Color(0xffFFBF3B);
Color g4 = new Color(0xffF49C00);
Color g5 = new Color(0xffb67300);

class Jsondecode {
  int jid;
  String jurl;
  String jphotographer;
  Srcx src;
  String jclolourcode;
  Jsondecode({
    this.jid,
    this.jurl,
    this.jphotographer,
    this.src,
    this.jclolourcode,
  });

  factory Jsondecode.fromMap(Map<String, dynamic> jdata) {
    return Jsondecode(
      jid: jdata["id"],
      jclolourcode: jdata["avg_color"],
      jurl: jdata["url"],
      jphotographer: jdata["photographer"],
      src: Srcx.fromMap(jdata["src"]),
    );
  }
}

class Srcx {
  String small;
  String medium;
  String potariat;
  String download;
  String ccode;
  Srcx({this.small, this.medium, this.potariat, this.download, this.ccode});
  factory Srcx.fromMap(Map<String, dynamic> sdata) {
    return Srcx(
        small: sdata["small"],
        medium: sdata["medium"],
        potariat: sdata["portrait"],
        download: sdata["original"],
        ccode: sdata["avg_color"]);
  }
}

class Listcato extends StatelessWidget {
  const Listcato({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Catlist(
        name: "City",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/city.jpg"),
        ),
      ),
      Catlist(
        name: "Forest",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/forest.jpg"),
        ),
      ),
      Catlist(
        name: "Ocean",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/ocean.jpeg"),
        ),
      ),
      Catlist(
        name: "Minimalist",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/min.webp"),
        ),
      ),
      //   Catlist(
      //     name: "Mist",
      //     im: Image(
      //       fit: BoxFit.cover,
      //       image: AssetImage("mist.jpeg"),
      //     ),
      //   ),
      Catlist(
        name: "Coding",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/code.jpg"),
        ),
      ),
      Catlist(
        name: "Black",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/black.jpg"),
        ),
      ),
      Catlist(
        name: "Love",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/love.webp"),
        ),
      ),
      Catlist(
        name: "Abstract",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/abst.jpg"),
        ),
      ),
      Catlist(
        name: "Art",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/art.jpg"),
        ),
      ),
      Catlist(
        name: "Food",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/food.webp"),
        ),
      ),
      Catlist(
        name: "Space",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/night.jpeg"),
        ),
      ),
      Catlist(
        name: "Dark",
        im: Image(
          fit: BoxFit.cover,
          image: AssetImage("images/dark.jpeg"),
        ),
      ),
    ]);
  }
}
