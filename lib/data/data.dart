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
          url:
              "https://images.pexels.com/photos/219692/pexels-photo-219692.jpeg?cs=srgb&dl=pexels-pixabay-219692.jpg&fm=jpg"),
      Catlist(
          name: "Forest",
          url:
              "https://images.pexels.com/photos/2876511/pexels-photo-2876511.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
      Catlist(
          name: "Ocean",
          url:
              "https://images.pexels.com/photos/1330218/pexels-photo-1330218.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
      Catlist(
          name: "Minimalist",
          url:
              "https://images.pexels.com/photos/4466240/pexels-photo-4466240.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
      Catlist(
          name: "Mist",
          url:
              "https://images.pexels.com/photos/1367192/pexels-photo-1367192.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
      Catlist(
          name: "Coding",
          url:
              "https://images.pexels.com/photos/247791/pexels-photo-247791.png?cs=srgb&dl=pexels-pixabay-247791.jpg&fm=jpg"),
      Catlist(
          name: "Black",
          url:
              "https://images.pexels.com/photos/1679719/pexels-photo-1679719.jpeg?cs=srgb&dl=pexels-markus-spiske-1679719.jpg&fm=jpg"),
      Catlist(
          name: "Love",
          url:
              "https://images.pexels.com/photos/1378849/pexels-photo-1378849.jpeg?cs=srgb&dl=pexels-helena-lopes-1378849.jpg&fm=jpg"),
      Catlist(
          name: "Abstract",
          url:
              "https://images.pexels.com/photos/1981468/pexels-photo-1981468.jpeg?cs=srgb&dl=pexels-steve-johnson-1981468.jpg&fm=jpg"),
      Catlist(
          name: "Art",
          url:
              "https://images.pexels.com/photos/1070534/pexels-photo-1070534.jpeg?cs=srgb&dl=pexels-steve-johnson-1070534.jpg&fm=jpg"),
      Catlist(
          name: "Food",
          url:
              "https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
      Catlist(
          name: "Space",
          url:
              "https://images.pexels.com/photos/2538107/pexels-photo-2538107.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
      Catlist(
          name: "Dark",
          url:
              "https://images.pexels.com/photos/753994/pexels-photo-753994.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    ]);
  }
}
