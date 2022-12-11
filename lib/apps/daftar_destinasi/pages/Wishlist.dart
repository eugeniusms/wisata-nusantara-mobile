import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/components/DestinasiDrawer.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: buildDestinasiDrawer(context),
      body: Center(
        child: Text('Wishlist'),
        // MULAI KERJAIN DARI SINI YA
      ),
    );
  }
}
