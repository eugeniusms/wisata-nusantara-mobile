// Aulia Najwa Salsabila
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/components/drawer_event.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/pages/add_event.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/utils/fetch.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
// import 'package:wisata_nusantara_mobile/apps/daftar_event/pages/ShowEvent.dart';

class DaftarEvent extends StatefulWidget {
  const DaftarEvent({super.key});

  @override
  State<DaftarEvent> createState() => _DaftarEventState();
}

class _DaftarEventState extends State<DaftarEvent> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Daftar Event"),
  //       backgroundColor:Color.fromARGB(255, 9, 42, 59),
  //     ),
  //     drawer: build(context),
  //     body:
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 9, 42, 59),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddEvent()));
        },
      ),
      appBar: AppBar(
        title: const Text("Daftar Event"),
        backgroundColor: Color.fromARGB(255, 9, 42, 59),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchEvent(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada event",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => ShowEvent(
                  //                 data: snapshot.data![index],
                  //               )));
                  // },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 10),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, blurRadius: 2)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          snapshot.data![index].foto,
                          width: 350,
                          height: 200,
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].nama}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                          "${snapshot.data![index].lokasi}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
