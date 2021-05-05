import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallx/data/data.dart';
import 'package:wallx/screen/catogories.dart';
import 'package:http/http.dart' as http;
import 'package:wallx/screen/search.dart';
import 'package:wallx/widget/extrawidgets.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ignore: deprecated_member_use
  final List<Jsondecode> wallpapers = new List();
  int noOfImageToLoad = 80, res = 1;

  int loading = 1;

  getWalli() async {
    var url =
        "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=$res";
    var walljson =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});
    // print(walljson.body.toString());
    Map<String, dynamic> wallis = jsonDecode(walljson.body);
    wallis["photos"].forEach((element) {
      Jsondecode wallcontent = new Jsondecode();
      wallcontent = Jsondecode.fromMap(element);
      wallpapers.add(wallcontent);
    });
    setState(() {
      loading = 0;
    });
  }

  void yo() {
    setState(() {
      res += 1;
      getWalli();
    });
  }

  @override
  void initState() {
    super.initState();
    getWalli();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(
        child: mainxx(context),
      ),
      Center(child: Catogories()),
    ];
    final _kTabs = <Tab>[
      const Tab(
        text: 'popular',
        // icon: Icon(Icons.cloud),
      ),
      const Tab(
        text: 'collections',
        // icon: Icon(Icons.alarm),
      ),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        backgroundColor: d1,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: FloatingActionButton(
              hoverColor: b,
              elevation: 10,
              focusElevation: 10,
              hoverElevation: 20,
              focusColor: d4,
              splashColor: g2,
              child: Icon(Icons.refresh),
              //   icon: Icon(Icons.refresh),
              //   label: Text("load more"),
              onPressed: () {
                yo();
                //
              }),
        ),
        appBar: AppBar(
          foregroundColor: d2,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                  splashColor: b,
                  hoverColor: b,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Searchwallpaper(starting: "")));
                  },
                  child: Icon(Icons.search)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: InkWell(
                  hoverColor: b,
                  splashColor: b,
                  onTap: () {
                    showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: d,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(50.0),
                                      topRight: const Radius.circular(50.0))),
                              height: 350,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.020),
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage("images/lp_logo.jpg"),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.008),
                                  Container(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text("developed by    ",
                                                  style: TextStyle(
                                                      fontFamily: 'Cabin',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.020,
                                            ),
                                            t1("api"),
                                            t1("github"),
                                            t1("source code"),
                                            t1("version"),
                                            t1("report"),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              child: InkWell(
                                                child: Text("Narayan",
                                                    style: TextStyle(
                                                        fontFamily: 'Cabin',
                                                        color: g4,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                            iw("pexels.com",
                                                "https://www.pexels.com"),
                                            iw("narayann7",
                                                "https://github.com/narayann7"),
                                            iw("here",
                                                "https://github.com/narayann7/pixelLab-WallpaperApp-/tree/master"),
                                            iw("0.5", ""),
                                            iw("here",
                                                "mailto:laxminarayanreddy432@gmail.com"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(Icons.info)),
            ),
          ],
          title: Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '            pixel',
                      style: TextStyle(
                          fontFamily: 'Cabin',
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: 'Lab',
                      style: TextStyle(
                          fontFamily: 'Cabin',
                          color: g4,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          backgroundColor: b,
          bottom: TabBar(
            indicatorColor: g4,
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }

  Widget mainxx(BuildContext context) {
    return loading == 1
        ? Container(
            child: CircularProgressIndicator(),
          )
        : wallPaperdisplay(wallpapers, context);
  }
}
