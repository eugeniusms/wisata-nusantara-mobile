// Rizka Nisrina Nabila

import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/utils/fetch.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wisata_nusantara_mobile/apps/authentication/models/User.dart';

class CeritaPerjalanan extends StatefulWidget {
  const CeritaPerjalanan({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _CeritaPerjalananState();
}

class _CeritaPerjalananState extends State<CeritaPerjalanan> {
  TextEditingController storyController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  final _reviewFormKey = GlobalKey<FormState>();
  String _review = "";
  String _username = UserLoggedIn.user.username;

  CookieRequest request = CookieRequest();
  int id = 0;
  bool loggedIn = false;

  final _coReview = TextEditingController();
  void clearInput() {
    _coReview.clear();
    setState(() {
      _review = "";
    });
  }

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
        body: jsonEncode(<String, dynamic>{
          'review': _review,
          'id': UserLoggedIn.user.username
        }));
    print(response.body);
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
                                  TextFormField(
                                    decoration: const InputDecoration(
                                        hintText:
                                            "Example: This destination ...",
                                        labelText: "Review",
                                        border: OutlineInputBorder()),
                                    controller: _coReview,
                                    // mengubah state isi dari judul sesuai value ketika ada perubahan
                                    onChanged: (String? value) {
                                      setState(() {
                                        _review = value!;
                                      });
                                    },
                                    // ketika onSaved maka akan mengubah state isi dari judul sesuai value
                                    onSaved: (String? value) {
                                      setState(() {
                                        _review = value!;
                                      });
                                    },
                                    // melakukan validasi form untuk kasus judul kosong
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Review cannot be empty!';
                                      }
                                      return null;
                                    },
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        if (_username != "" && _review != "") {
                                          print(_username);
                                          print(_review);

                                          // POST TO BACKEND
                                          final response = await request.postJson(
                                              "https://wisata-nusa.up.railway.app/story/submit_json/",
                                              jsonEncode({
                                                "review": _review,
                                                "username": _username,
                                              }));

                                          SnackBar(
                                            content: const Text(
                                                "Review berhasil disimpan!"),
                                            action: SnackBarAction(
                                              label: 'Hide',
                                              onPressed: () {},
                                            ),
                                          );

                                          clearInput();
                                        } else {
                                          SnackBar(
                                            content: const Text(
                                                "Review gagal disimpan!"),
                                            action: SnackBarAction(
                                              label: 'Hide',
                                              onPressed: () {},
                                            ),
                                          );

                                          clearInput();
                                        }
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
