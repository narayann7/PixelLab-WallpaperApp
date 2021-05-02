import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallx/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallx/widget/extrawidgets.dart';

class Searchwallpaper extends StatefulWidget {
  String starting = "";
  Searchwallpaper({Key key, @required this.starting}) : super(key: key);

  @override
  _SearchwallpaperState createState() => _SearchwallpaperState();
}

class _SearchwallpaperState extends State<Searchwallpaper> {
  TextEditingController querywalli = new TextEditingController();
  ScrollController _scrollController = new ScrollController();

  // ignore: deprecated_member_use
  final List<Jsondecode> wallpapers = new List();
  int res = 1;
  String keysearch;
  bool searched = false;
  getWalli(String querysearch) async {
    var url =
        "https://api.pexels.com/v1/search?query=$querysearch&per_page=80&page=$res";
    var walljson =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});
    // print(walljson.body.toString());
    Map<String, dynamic> wallis = jsonDecode(walljson.body);
    wallis["photos"].forEach((element) {
      Jsondecode wallcontent = new Jsondecode();
      wallcontent = Jsondecode.fromMap(element);
      wallpapers.add(wallcontent);
    });
    // print(wallis);
    setState(() {});
  }

  void yo() {
    setState(() {
      res += 1;
      if (widget.starting != "") {
        getWalli(widget.starting);
        searched = true;
      } else {
        getWalli(querywalli.text);
      }
    });
  }

  @override
  void initState() {
    //getWallpaper();
    wallpapers.clear();

    if (widget.starting != "") {
      getWalli(widget.starting);
      searched = true;
    }

    super.initState();
    getWalli(querywalli.text);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("endedbitch");
        res += 1;
        yo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: d,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          yo();
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30)),
            //   padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    style: TextStyle(color: b, fontSize: 18.5),
                    cursorColor: g4,
                    controller: querywalli,
                    onSubmitted: (String wa) {
                      setState(() {
                        keysearch = querywalli.text;
                        res = 1;
                        getWalli(querywalli.text);
                        print(querywalli.text);
                      });
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: b),
                        hintText:
                            widget.starting != "" ? widget.starting : 'search',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        keysearch = querywalli.text;
                        getWalli(querywalli.text);
                        searched = true;
                        initState();
                        print(querywalli.text);
                      });
                    },
                    child: Icon(
                      Icons.search,
                      color: b,
                    )),
              )
            ]),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          wallisearch(context)
        ]),
      ),
    );
  }

  // ignore: deprecated_member_use

  Container wallisearch(BuildContext context) => Container(
      child: searched == false
          ? Listcato()
          : wallPaperdisplay(wallpapers, context));
}
