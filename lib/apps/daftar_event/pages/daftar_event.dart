// Aulia Najwa Salsabila
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:wisata_nusantara_mobile/apps/daftar_event/pages/add_event.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/pages/single_event.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/utils/fetch.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/models/User.dart';

class DaftarEvent extends StatefulWidget {
  const DaftarEvent({super.key});

  @override
  State<DaftarEvent> createState() => _DaftarEventState();
}

Future<http.Response> delete(int pk) async {
  var url =
      "https://wisata-nusa.up.railway.app/event/delete_from_flutter/${pk}";
  final http.Response response = await http.delete(Uri.parse(url));
  return response;
}

class _DaftarEventState extends State<DaftarEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Daftar Event"),
          // backgroundColor: Color.fromARGB(255, 9, 42, 59),
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
                return Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.greenAccent, Colors.blueGrey])),
                    child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleEvent(
                                          data: snapshot.data![index],
                                        )));
                          },
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
                                Visibility(
                                  visible: UserLoggedIn.user.username == "admin"
                                      ? true
                                      : false,
                                  child: IconButton(
                                      onPressed: () async {
                                        // final delUrl =
                                        //     "https://wisata-nusa.up.railway.app/event/delete_from_flutter/<id>";
                                        // var url = Uri.parse(delUrl);
                                        // final response = await http
                                        // .delete(snapshot.data![index].pk);
                                        await delete(snapshot.data![index].pk);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DaftarEvent()));
                                      },
                                      icon: Icon(Icons.delete)),
                                ),
                                Image.network(
                                  snapshot.data![index].foto,
                                  width: 350,
                                  height: 200,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("${snapshot.data![index].nama}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text(
                                  "${snapshot.data![index].lokasi}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                            )));
              }
            }
          },
        ),
        floatingActionButton: Visibility(
          visible: UserLoggedIn.user.username == "" ? false : true,
          child: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 9, 42, 59),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddEvent()));
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
