// Eugenius Mario Situmorang
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/utils/fetch.dart';

class DaftarDestinasi extends StatelessWidget {
  const DaftarDestinasi({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: buildDrawer(context),
        body: FutureBuilder(
            future: fetchDestination(),
            builder: (context, AsyncSnapshot snapshot) {
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
