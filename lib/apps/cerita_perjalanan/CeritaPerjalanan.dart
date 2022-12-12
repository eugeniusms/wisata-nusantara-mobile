// Rizka Nisrina Nabila

import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/utils/fetch.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CeritaPerjalanan extends StatefulWidget {
  const CeritaPerjalanan({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _CeritaPerjalananState();
}

class _CeritaPerjalananState extends State<CeritaPerjalanan> {
  TextEditingController storyController = TextEditingController();
  final _reviewFormKey = GlobalKey<FormState>();
  String _review = "";

  CookieRequest request = CookieRequest();
  int id = 0;
  bool loggedIn = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final _request = Provider.of<CookieRequest>(context, listen: false);

      if (!_request.loggedIn) {
      } else {
        setState(() {
          request = _request;
          //id = _request.id;
          //loggedIn = _request.loggedIn;
        });
      }
    });
  }

  Future<void> submit(BuildContext context, String id) async {
    print("test");
    final response = await http.post(
        Uri.parse('https://wisata-nusa.up.railway.app/story/submit_json/'),
        headers: <String, String>{'Context-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{'review': _review, 'id': id}));
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final response =
        request.get('https://wisata-nusa.up.railway.app/story/json/');
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cerita Perjalanan"),
        ),
        drawer: buildDrawer(context),
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.greenAccent, Colors.blueGrey])),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Give us a review!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white,
                          elevation: 4,
                          child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextField(
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder()),
                                    controller:
                                        storyController, // untuk ambil value story-nya
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_reviewFormKey.currentState!
                                            .validate()) {
                                          print("test");
                                          int id = 0; //masih dummy karena id user belum ada
                                          submit(context, id.toString());
                                        }
                                        final successBar = SnackBar(
                                          content: const Text(
                                              "Review berhasil disimpan!"),
                                          action: SnackBarAction(
                                            label: 'Hide',
                                            onPressed: () {},
                                          ),
                                        );
                                      },
                                      child: const Text("Send"))
                                ],
                              )),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        "Apa kata mereka?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: FutureBuilder(
                        future: response,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (snapshot.data.length < 1) {
                              return Column(
                                children: const [
                                  Text(
                                    "Belum ada cerita :(",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8), fontSize: 20),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              );
                            } else {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (_, index) => Column(
                                  children: [
                                    Text(
                                        snapshot.data[index]["fields"]["name"]),
                                    Text(snapshot.data[index]["fields"]
                                        ["review"]),
                                    TextButton(
                                      onPressed: () async {
                                        var response = await request.post(
                                            "https://wisata-nusa.up.railway.app/story/delete_json/${snapshot.data[index]["pk"]}",
                                            {});
                                      },
                                      // ini action kalau button ditekan;
                                      child: Text(
                                        "Delete",
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        primary: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                itemCount: snapshot.data.length,
                              );
                            }
                          }
                        }))
              ],
            )));
  }
}
