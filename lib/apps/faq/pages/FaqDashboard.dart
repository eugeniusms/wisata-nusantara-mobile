import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FaqDetailScreenPage.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FormFaq.dart';
import 'package:wisata_nusantara_mobile/apps/faq/utils/fetch.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:wisata_nusantara_mobile/apps/faq/components/FaqDrawer.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 48, 55),
      drawer: buildFaqDrawer(context),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.greenAccent, Colors.blueGrey])),
          child: ListView(
        shrinkWrap: true,
        children: [
          FutureBuilder(
              future: fetchPublicFAQ(),
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
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.green, blurRadius: 2.0)
                                ]),
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                                todo: snapshot.data![index])));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    ],
                                  ),
                                ),
                              ],
                            )));
                  }
                }
              }),
        ],
          )),
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
                MaterialPageRoute(builder: (context) => const FaqForm()),
              );
            },
          ),
        ),
      ]),
    );
  }
}
