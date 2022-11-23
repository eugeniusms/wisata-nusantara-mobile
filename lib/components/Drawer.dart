import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/Authentication.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/CeritaPerjalanan.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/DaftarDestinasi.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/DaftarEvent.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:wisata_nusantara_mobile/apps/faq/FAQ.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/PanduanPerjalanan.dart';

// merupakan sebuah Drawer yang digunakan untuk navigasi antar page
Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      // menu navigasi
      children: [
        ListTile(
          title: const Text('Dashboard'),
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
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DaftarEvent(
                        title: "Event",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Journey'),
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
