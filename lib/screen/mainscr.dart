// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:wallx/data/data.dart';

// class HomeX extends StatefulWidget {
// //   final List<Jsondecode> wallpapersx;
// //    @required this.wallpapersx,
//   HomeX({
//     Key key,
//   }) : super(key: key);

//   @override
//   _HomeXState createState() => _HomeXState();
// }

// class _HomeXState extends State<HomeX> {
//      final List<Jsondecode> wallpapers = new List();

//   int noOfImageToLoad = 80, res = 1;
//   getWalli() async {
//     var url =
//         "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=$res";
//     var walljson =
//         await http.get(Uri.parse(url), headers: {"Authorization": apiKey});
//     // print(walljson.body.toString());
//     Map<String, dynamic> wallis = jsonDecode(walljson.body);
//     wallis["photos"].forEach((element) {
//       Jsondecode wallcontent = new Jsondecode();
//       wallcontent = Jsondecode.fromMap(element);
//       wallpapers.add(wallcontent);
//     });
//     // print(wallis);
//     setState(() {});
//   }

//   ScrollController _scrollController = new ScrollController();
//   void yo() {
//     setState(() {
//       res += 1;
//       getWalli();
//     });
//   }

//   @override
//   void initState() {
//     //getWallpaper();

//     super.initState();
//     getWalli();

//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         yo();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  ;
//   }
// }
