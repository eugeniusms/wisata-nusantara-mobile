import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/models/Event.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

class SingleEvent extends StatelessWidget {
  final Event data;
  SingleEvent({required this.data});

  @override
  Widget build(BuildContext context) {
    // var data;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Event Details"),
        backgroundColor: Color.fromARGB(255, 9, 42, 59),
      ),
      drawer: buildDrawer(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  data.foto,
                  width: 600,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    data.nama,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
                Center(
                  child: Text(
                    data.lokasi,
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 1.0, color: Colors.grey),
                  ),
                )
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Flexible(
                    child: Text(
                      data.deskripsi,
                      style: TextStyle(fontSize: 16, letterSpacing: 1.0),
                    ),
                  )
                ])
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 9, 42, 59),
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back', style: TextStyle(fontSize: 13)),
        )
      ],
    );
  }
}
