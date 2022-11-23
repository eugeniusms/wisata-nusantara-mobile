// Aulia Najwa Salsabila
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

class DaftarEvent extends StatelessWidget {
  const DaftarEvent({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Text('Daftar Event'),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
