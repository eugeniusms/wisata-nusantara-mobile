// Eugenius Mario Situmorang
import 'package:flutter/material.dart';
// import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/components/DestinasiDrawer.dart';
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
        // backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Destination"),
      ),
      // menambahkan Drawer untuk navigasi antarhalaman
      drawer: buildDestinasiDrawer(context),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.greenAccent, Colors.blueGrey])),
          child: FutureBuilder(
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
                              horizontal: 50, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 2.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  snapshot.data![index].foto_cover_url,
                                  height: 200,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "${snapshot.data![index].nama}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${snapshot.data![index].lokasi}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    " ${snapshot.data![index].jumlah_suka} Likes",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              )
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
        ));
  }
}
