import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class PembayaranCard extends StatefulWidget {
  @override
  State<PembayaranCard> createState() => _PembayaranCardState();
}

class _PembayaranCardState extends State<PembayaranCard> {
  int endTime = DateTime.parse('2022-08-05').millisecondsSinceEpoch + 1000 * 30;

  XFile image;

  List _images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future sendImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    var uri = "http://172.16.46.203/flutter_upload_image/create.php";

    var request = http.MultipartRequest('POST', Uri.parse(uri));

    if (img != null) {
      var pic = await http.MultipartFile.fromPath("image", img.path);

      request.files.add(pic);

      await request.send().then((result) {
        http.Response.fromStream(result).then((response) {
          var message = jsonDecode(response.body);

          // show snackbar if input data successfully
          final snackBar = SnackBar(content: Text(message['message']));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          //get new list images
          getImageServer();
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  Future getImageServer() async {
    try {
      final response = await http
          .get(Uri.parse('http://172.16.46.203/flutter_upload_image/list.php'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _images = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getImageServer();
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      sendImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload Bukti Transfer'),
          actions: [
            IconButton(
              onPressed: () => myAlert(),
              icon: Icon(Icons.upload),
            )
          ],
        ),
        body: _images.length != 0
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _images.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: NetworkImage(
                          'http://192.168.1.13/flutter_upload_image/images/' +
                              _images[index]['image']),
                      fit: BoxFit.cover,
                    ),
                  );
                })
            : Center(
                child: Text("No Image"),
              ));
  }
}
  // @override
  // Widget build(BuildContext context) {
    // Widget header() {
    //   return AppBar(
    //     backgroundColor: backgroundColor1,
    //     elevation: 0,
    //     centerTitle: true,
    //     title: Text('Pembayaran'),
    //   );
    // }

    // Widget content() {
    //   return Container(
    //     child: CountdownTimer(
    //       endTime: endTime,
    //       widgetBuilder: (_, CurrentRemainingTime time) {
    //         if (time == null) {
    //           return Text('Game over');
    //         }
    //         return Text(
    //             'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
    //       },
    //     ),
    //   );
    // }

    // return Scaffold(
    //   backgroundColor: backgroundColor2,
    //   appBar: header(),
    //   body: content(),
    // );
//   }
// }
