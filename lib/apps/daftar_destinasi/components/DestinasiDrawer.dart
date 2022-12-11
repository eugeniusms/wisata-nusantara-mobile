import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/Authentication.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/pages/LoginPage.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/pages/DaftarDestinasi.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/pages/Wishlist.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/pages/DestinasiForm.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// merupakan sebuah Drawer yang digunakan untuk navigasi antar page
Drawer buildDestinasiDrawer(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Drawer(
    child: ListView(
      padding: EdgeInsets.only(top: 60.0, left: 30.0),
      // menu navigasi
      children: [
        ListTile(
          title: const Text('Back'),
          leading: const Icon(Icons.arrow_back),
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
              MaterialPageRoute(builder: (context) => DaftarDestinasi()),
            );
          },
        ),
        ListTile(
          title: const Text('Wishlist'),
          leading: const Icon(Icons.favorite),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => WishlistPage(
                        title: "Wishlist",
                      )),
            );
          },
        ),
        ListTile(
          title: const Text('Add Destination'),
          leading: const Icon(Icons.add),
          // saat diklik maka Navigator akan mengarahkan ke halaman Form
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const DestinasiFormPage()),
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
                  builder: (context) => LoginPage(
                        title: "Login",
                      )),
            );
          },
        ),
        const Divider(),
        ListTile(
          title: const Text('Log Out'),
          leading: const Icon(Icons.logout),
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
  );
}
