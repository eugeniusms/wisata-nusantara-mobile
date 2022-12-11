import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/Authentication.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/CeritaPerjalanan.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/DaftarDestinasi.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/screens/daftar_event.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/screens/daftar_event.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:wisata_nusantara_mobile/apps/faq/FAQ.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/PanduanPerjalanan.dart';

// merupakan sebuah Drawer yang digunakan untuk navigasi antar page
Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.only(top: 60.0, left: 30.0),
      // menu navigasi
      children: [
        ListTile(
          title: const Text('Dashboard'),
          leading: const Icon(Icons.house),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard(
                        title: "Dashboard",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Destination'),
          leading: const Icon(Icons.tour),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DaftarDestinasi(
                        title: "Destination",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Event'),
          leading: const Icon(Icons.event),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DaftarEvent(
                      // title: "Event",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Journey'),
          leading: const Icon(Icons.map),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PanduanPerjalanan(
                        title: "Journey",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Story'),
          leading: const Icon(Icons.book),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => CeritaPerjalanan(
                        title: "Story",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('FAQ'),
          leading: const Icon(Icons.question_answer),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => FAQ(
                        title: "FAQ",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Login'),
          leading: const Icon(Icons.login),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Authentication(
                        title: "Login",
                      )),
            );
          },
        ),
      ],
    ),
  );
}
