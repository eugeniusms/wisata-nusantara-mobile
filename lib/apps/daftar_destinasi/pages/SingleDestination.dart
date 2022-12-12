import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/models/destination.dart';

class SingleDestination extends StatelessWidget {
  final Destination data;
  SingleDestination({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Container(
                height: 80.0,
                padding: EdgeInsets.all(20.0),
                child: Text("${data.nama}",
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w800,
                        color: Colors.black))),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                data.foto_cover_url,
                width: 400,
              ),
            ),
            const SizedBox(height: 20),
            Align(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text("Location: ",
                      style:
                          TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Text("${data.lokasi}, Indonesia",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
                Row(children: [
                  Text("Category: ",
                      style:
                          TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Text("${data.kategori}",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
                Row(children: [
                  Text("Like: ",
                      style:
                          TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Text("${data.jumlah_suka}",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Description: ",
                      style:
                          TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  Text("${data.deskripsi}",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ]),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// References:
// *) https://medium.com/flutter-community/simple-ways-to-pass-to-and-share-data-with-widgets-pages-f8988534bd5b
// *) https://dev.to/thepythongeeks/how-to-make-a-clickable-container-in-flutter-1953
// *) https://www.fluttercampus.com/guide/84/how-to-change-font-style-of-text-widget-flutter/
// *) https://stackoverflow.com/questions/54513641/flutterwhy-my-column-alignment-is-always-center