import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wisata_nusantara_mobile/apps/faq/models/public_faq_model.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FaqDetailScreenPage.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FormFaq.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  Future<List<PublicFaq>> fetchToDo() async {
    var url = Uri.parse('https://wisata-nusa.up.railway.app/faq/json/public/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<PublicFaq> listFaq = [];
    for (var d in data) {
      if (d != null) {
        listFaq.add(PublicFaq.fromJson(d));
      }
    }

    return listFaq;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Watchlist'),
      // ),
      // drawer: const Drawer(),
      body: FutureBuilder(
          future: fetchToDo(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada MyWatchlist :(",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.green, blurRadius: 2.0)
                            ]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        todo: snapshot.data![index])));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),

                              Text(
                                "${snapshot.data![index].fields.question}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Text(
                              //     "${snapshot.data![index].fields.releaseDate}"),
                            ],
                          ),
                        )));
              }
            }
          }),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: FloatingActionButton.extended(
            tooltip: 'Ask New Question',
            hoverElevation: 50,
            label: const Text('Ask New Question'),
            icon: const Icon(Icons.thumb_up),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FaqForm(
                        // title: "Dashboard",
                        )),
              );
            },
          ),
        ),
      ]),
    );
  }
}
