// Eugenius Mario Situmorang
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

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
      body: Center(
        child: Text('Daftar Destinasi'),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
