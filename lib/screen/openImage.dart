import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:wallx/data/data.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _showToast = () => Fluttertoast.showToast(
    msg: 'wallpaper saved',
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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 19),
        child: FloatingActionButton.extended(
          backgroundColor: g4.withOpacity(0.85),
          icon: Icon(Icons.file_download),
          label: Text("download"),
          onPressed: () {
            _save();
            Navigator.pop(context);
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

  _save() async {
    await _askPermission();
    var response = await Dio()
        .get(download, options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    _showToast();
  }

  _askPermission() async {
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.camera,
      ].request();
      print(statuses[
          Permission.storage]); // it should print PermissionStatus.granted
    }
  }
}
