// Wahyu Sahrijal
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Text('Authentication'),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
