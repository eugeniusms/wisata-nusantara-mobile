// All
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: Text('Dashboard'),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
