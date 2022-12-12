import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/faq/components/FaqDrawer.dart';
import 'package:wisata_nusantara_mobile/apps/faq/models/private_faq_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class PrivateFaqScreen extends StatefulWidget {
  const PrivateFaqScreen({super.key});

  @override
  State<PrivateFaqScreen> createState() => _PrivateFaqScreenPageState();
}

class _PrivateFaqScreenPageState extends State<PrivateFaqScreen> {
  getData(request) async {
    final response = await request
        .get("https://wisata-nusa.up.railway.app/faq/json/private/");
    if (response[0] == null) {
      return {"status": false};
    } else {
      // PrivateFaq user = PrivateFaq.fromJson(response[0]);
      // print(response);
      return response;
      // return {"user": user, "status": true};
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // final dataa = getData(request);

    return Scaffold(
      appBar: AppBar(title: const Text('My Question')),
      drawer: buildFaqDrawer(context),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.greenAccent, Colors.blueGrey])),
          child: FutureBuilder(
        future: getData(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                    // height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.green, blurRadius: 2.0)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          "${snapshot.data[index]["fields"]["question"]}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text("${snapshot.data[index]["fields"]["username"]}"),
                      ],
                    )));
          }
        },
      ),
        ));
  }
}
