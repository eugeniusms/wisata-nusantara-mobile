import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/Authentication.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/pages/LoginPage.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/CeritaPerjalanan.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/pages/DaftarDestinasi.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/pages/daftar_event.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:wisata_nusantara_mobile/apps/faq/FAQ.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/PanduanPerjalanan.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// merupakan sebuah Drawer yang digunakan untuk navigasi antar page
Drawer buildDrawer(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Drawer(
      child: Container(
    color: Colors.black,
    child: ListView(
      padding: const EdgeInsets.only(top: 60.0, left: 30.0),
      // menu navigasi
      children: [
        ListTile(
          title:
              const Text('Dashboard', style: TextStyle(color: Colors.yellow)),
          leading: const Icon(Icons.house, color: Colors.yellow),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Dashboard(
                        title: "Wisata Nusantara",
                      )),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title:
              const Text('Destination', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.tour, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DaftarDestinasi()),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('Event', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.event, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DaftarEvent()),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('Journey', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.map, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const PanduanPerjalanan(
                        title: "Journey",
                      )),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('Story', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.book, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const CeritaPerjalanan(
                        title: "Story",
                      )),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('FAQ', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.question_answer, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const FAQ(
                        title: "FAQ",
                      )),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('Login', style: TextStyle(color: Colors.green)),
          leading: const Icon(Icons.login, color: Colors.green),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginPage(
                        title: "Login",
                      )),
            );
          },
        ),
        Divider(color: Colors.white),
        ListTile(
          title: const Text('Log Out', style: TextStyle(color: Colors.red)),
          leading: const Icon(Icons.logout, color: Colors.red),
          onTap: () async {
            final response = await request.logout(
                "https://wisata-nusa.up.railway.app/auth-flutter/logout/");
            if (response['status']) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Successfully logged out!"),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage(title: "Login")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("An error occured, please try again."),
              ));
            }
          },
        ),
      ],
    ),
  ));
}
