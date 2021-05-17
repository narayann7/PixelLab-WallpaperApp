import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:wallx/data/data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

final _showToast = (String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: d.withOpacity(0.8));

class Openimage extends StatelessWidget {
  final String url;
  final String download;

  const Openimage({
    @required this.url,
    @required this.download,
  });

  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio();

    String Filenamemethod() {
      List<String> spliting = download.split("/");
      return spliting[spliting.length - 1];
    }

    Future<bool> requestPremission(Permission permission) async {
      if (await permission.isGranted)
        return true;
      else {
        var result = await permission.request();
        if (result == PermissionStatus.granted)
          return true;
        else
          return false;
      }
    }

    Future<bool> save(String url, String filename) async {
      Directory directory;
      try {
        if (await requestPremission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          directory = Directory("/storage/emulated/0/Download/");
          print(directory);
        } else
          return false;

        if (!await directory.exists()) directory.createSync(recursive: true);

        if (await directory.exists()) {
          File savefile = File(directory.path + filename);
          print(directory.path);
          await dio.download(url, savefile.path);
        }
        _showToast("wallpaper downloaded");

        return true;
      } catch (e) {
        _showToast("downloaded failed");
      }
      return false;
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: FloatingActionButton.extended(
          backgroundColor: g4.withOpacity(0.85),
          icon: Icon(Icons.file_download),
          label: Text("download"),
          onPressed: () async {
            print(Filenamemethod());
            String name = Filenamemethod();
            await save(download, name);
            // Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: url,
          child: Container(
              child: CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) => Container(
                        color: Colors.amber,
                      ),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
