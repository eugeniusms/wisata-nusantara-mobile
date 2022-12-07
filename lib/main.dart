import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
          scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      // menampilkan judul pada CounterPage
      home: const Dashboard(title: 'Wisata Nusantara'),
    );
  }
}

Future startApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
