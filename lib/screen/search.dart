import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallx/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallx/widget/extrawidgets.dart';

// ignore: must_be_immutable
class Searchwallpaper extends StatefulWidget {
  String starting = "";
  Searchwallpaper({Key key, @required this.starting}) : super(key: key);

  @override
  _SearchwallpaperState createState() => _SearchwallpaperState();
}

class _SearchwallpaperState extends State<Searchwallpaper> {
  TextEditingController querywalli = new TextEditingController();
  int loading = 0;
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
    setState(() {
      loading = 1;
    });
  }

  void yo() {
    setState(() {
      res += 1;
      if (widget.starting != "") {
        keysearch = widget.starting;
        widget.starting = "";
        getWalli(keysearch);
        searched = true;
      } else {
        getWalli(querywalli.text);
      }
    });
  }

  @override
  void initState() {
    //getWallpaper();

    super.initState();
    if (widget.starting != "") {
      getWalli(widget.starting);
      searched = true;
    } else
      getWalli(querywalli.text);
    print("helloo bitch");
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
                        loading = 0;

                        if (querywalli.text == "")
                          searched = false;
                        else
                          searched = true;

                        if (widget.starting != "") {
                          widget.starting = "";
                        }
                        keysearch = querywalli.text;
                        wallpapers.clear();
                        res = 1;
                        getWalli(querywalli.text);
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
                        loading = 0;
                        if (querywalli.text == "")
                          searched = false;
                        else
                          searched = true;
                        if (widget.starting != "") {
                          widget.starting = "";
                        }
                        keysearch = querywalli.text;
                        wallpapers.clear();
                        getWalli(querywalli.text);
                        initState();
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

  Container wallisearch(BuildContext context) => Container(
      child: searched == false
          ? Listcato()
          : loading == 0
              ? Container(
                  child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  CircularProgressIndicator()
                ]))
              : wallPaperdisplay(wallpapers, context));
}
