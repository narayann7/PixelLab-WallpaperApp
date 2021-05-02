import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallx/data/data.dart';
import 'package:wallx/screen/openImage.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

Widget wallPaperdisplay(List<Jsondecode> wallpapersx, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 12, right: 12, top: 5),
    child: GridView.count(
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      mainAxisSpacing: 6,
      shrinkWrap: true,
      crossAxisSpacing: 6.0,
      children: wallpapersx.map((e) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Openimage(
                      download: e.src.download, url: e.src.potariat)));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: d,
                    offset: const Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 6.0,
                    spreadRadius: -3.0,
                  ), //BoxShadow
                  //BoxShadow
                ],
              ),
              padding: EdgeInsets.all(3.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Hero(
                  tag: e.src.potariat,
                  child: Container(
                      child: CachedNetworkImage(
                          imageUrl: e.src.potariat,
                          placeholder: (context, url) => Container(
                                color: e.jclolourcode.toColor(),
                              ),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget t1(String left) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: Text("$left   - ",
        style: TextStyle(
            fontFamily: 'Cabin',
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold)),
  );
}

Widget iw(String right, String link) {
  return Padding(
    padding: const EdgeInsets.all(3.0),
    child: InkWell(
      onTap: () {
        launch(link);
      },
      child: Text(right,
          style: TextStyle(
              fontFamily: 'Cabin',
              color: g4,
              fontSize: 17,
              fontWeight: FontWeight.bold)),
    ),
  );
}
