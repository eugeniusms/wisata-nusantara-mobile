// Abdillah Assajjad
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/faq/utils/fetch.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: ToDoPage(),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
