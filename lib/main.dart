import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';

// TEST WEBHOOK

void main() {
  runApp(const WisataNusantara());
}

class WisataNusantara extends StatelessWidget {
  // inisiasi key pada contructor CounterSeven
  const WisataNusantara({super.key});

  // widget root of application.
  @override
  Widget build(BuildContext context) {
    // seperti meta tag pada html
    return MaterialApp(
      title: 'Wisata Nusantara',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // menampilkan judul pada CounterPage
      home: const Dashboard(title: 'Wisata Nusantara'),
    );
  }
}
