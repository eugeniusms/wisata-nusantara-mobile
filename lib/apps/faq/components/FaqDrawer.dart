import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/pages/LoginPage.dart';
import 'package:wisata_nusantara_mobile/apps/faq/FAQ.dart';
import 'package:wisata_nusantara_mobile/apps/faq/pages/FaqPrivateQuestion.dart';
import 'package:wisata_nusantara_mobile/apps/dashboard/Dashboard.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

// merupakan sebuah Drawer yang digunakan untuk navigasi antar page
Drawer buildFaqDrawer(BuildContext context) {
  final request = context.watch<CookieRequest>();
  return Drawer(
      child: Container(
    color: Colors.black,
    child: ListView(
      padding: const EdgeInsets.only(top: 60.0, left: 30.0),
      // menu navigasi
      children: [
        ListTile(
          title: const Text('Back', style: TextStyle(color: Colors.yellow)),
          leading: const Icon(Icons.arrow_back, color: Colors.yellow),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const Dashboard(
                        title: "Dashboard",
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
          title:
              const Text('My Question', style: TextStyle(color: Colors.white)),
          leading: const Icon(Icons.question_mark, color: Colors.white),
          onTap: () {
            // Route menu ke counter
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PrivateFaqScreen()),
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
          title: const Text('Logout', style: TextStyle(color: Colors.red)),
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
