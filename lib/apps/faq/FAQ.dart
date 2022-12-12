// Abdillah Assajjad
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FaqDashboard.dart';
import 'package:wisata_nusantara_mobile/apps/faq/components/FaqDrawer.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildFaqDrawer(context),
      body: const Center(
        child: FAQPage(),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
