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
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.greenAccent, Colors.blueGrey]),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          padding: const EdgeInsets.only(
              right: 20.0, left: 20.0, top: 35.0, bottom: 60.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            padding: EdgeInsets.only(
                right: 40.0, left: 40.0, top: 20.0, bottom: 20.0),
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
                    width: 300,
              ),
            ),
            const SizedBox(height: 20),
            Align(
                    
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    // ============================= LOCATION ================================
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  Icon(Icons.location_on,
                                      color: Colors.green[600]),
                                  Text("Location ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.green[600]))
                                ]),
                                Row(children: [
                                  Icon(Icons.favorite, color: Colors.red[600]),
                                  Text("${data.jumlah_suka}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700)),
                                  Text(" likes",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black))
                                ])
                              ]),
                          Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text("${data.lokasi}, Indonesia",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  )))
                        ]),
                    // ============================= CATEGORY ================================
                    SizedBox(height: 10),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Icon(Icons.category, color: Colors.orange[600]),
                            Text("Category ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange[600]))
                          ]),
                          Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Text("${data.kategori}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  )))
                        ]),
                    // ============================= DESCRIPTION ================================
                    SizedBox(height: 10),

                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Description",
                      style:
                          TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                              SizedBox(height: 10),
                  Text("${data.deskripsi}",
                      style: TextStyle(fontSize: 16, color: Colors.black))
                            ])),
              ],
            ))
          ],
        ),
      ),
        ));
  }
}

// References:
// *) https://medium.com/flutter-community/simple-ways-to-pass-to-and-share-data-with-widgets-pages-f8988534bd5b
// *) https://dev.to/thepythongeeks/how-to-make-a-clickable-container-in-flutter-1953
// *) https://www.fluttercampus.com/guide/84/how-to-change-font-style-of-text-widget-flutter/
// *) https://stackoverflow.com/questions/54513641/flutterwhy-my-column-alignment-is-always-center