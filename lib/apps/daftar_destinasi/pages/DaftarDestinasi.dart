// Eugenius Mario Situmorang
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/models/destination.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/utils/fetch.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/pages/SingleDestination.dart';

class DaftarDestinasi extends StatefulWidget {
  const DaftarDestinasi({super.key});

  @override
  State<DaftarDestinasi> createState() => _DaftarDestinasiState();
}

class _DaftarDestinasiState extends State<DaftarDestinasi> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Destination"),
      ),
      // menambahkan Drawer untuk navigasi antarhalaman
      drawer: buildDrawer(context),
      body: FutureBuilder(
          future: fetchDestination(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada destinasi :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 2.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].nama}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleDestination(
                                      data: snapshot.data![index],
                                    )),
                          );
                        }));
              }
            }
          }),
    );
  }
}
