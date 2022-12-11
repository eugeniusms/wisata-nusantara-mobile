// Septio Nugroho
import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/components/Drawer.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/page/form.dart';

class PanduanPerjalanan extends StatelessWidget {
  const PanduanPerjalanan({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Map<String, String> contentText = {
      "heading": "Panduan Perjalanan",
      "heroDescription":
          "Panduan Perjalanan berisikan informasi dan rekomendasi perlengkapan yang berguna untuk perjalanan wisata yang aman dan nyaman",
      "subHeading": "Deskripsi Perjalanan".toUpperCase(),
      "descriptionHeading": "Terdapat 2 hal dalam panduan perjalanan",
      "titlePanduan1": "Ramalan cuaca terkini",
      "panduan1":
          "Ramalan cuaca di dua kota, kota keberangkatan dan kota destinasi. Dengan begitu, anda dapat mengetahui kondisi tujuan wisata serta berangkat di saat cuaca yang baik!",
      "titlePanduan2": "Rekomendasi perlengkapan sesuai kondisi cuaca",
      "panduan2":
          "Dengan informasi cuaca, anda dapat mengetahui perlengkapan apa saja yang dibutuhkan untuk perjalanan anda. Dengan begitu, anda dapat menyiapkan perlengkapan yang dibutuhkan sesuai dengan kondisi cuaca yang ada!",
      "titleForm": "Mulai pandu perjalanan!",
      "formDescription":
          "Hanya perlu mengisi form dengan kota keberangkatan dan kota destinasi",
    };

    Padding bottomPadding(double size) => Padding(
          padding: EdgeInsets.only(bottom: size),
        );

    Widget flexibleText(
      Padding paddingStyle,
      String text,
      TextAlign align,
      Color color,
      double fsize,
      FontWeight fweight,
      double spacing,
      double height,
    ) =>
        Container(
          padding: paddingStyle.padding,
          child: Row(
            children: <Widget>[
              Flexible(
                  child: Text(text,
                      textAlign: align,
                      style: TextStyle(
                        color: color,
                        fontSize: fsize,
                        fontWeight: fweight,
                        wordSpacing: spacing,
                        height: height,
                      ))),
            ],
          ),
        );

    Widget imageWidget(String image) => Container(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Image.asset(
            "assets/images/panduan-perjalanan/$image",
            width: 300,
          ),
        );

    final submitBtn = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[600],
        minimumSize: const Size.fromHeight(50), // NEW
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const FormPage();
        }));
      },
      child: const Text(
        'Pandu Perjalanan',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: buildDrawer(context),
        body: Container(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    flexibleText(
                        bottomPadding(8.0),
                        contentText["subHeading"]!,
                        TextAlign.left,
                        Colors.green[600]!,
                        12,
                        FontWeight.w600,
                        2,
                        1),
                    flexibleText(
                        bottomPadding(32.0),
                        contentText["descriptionHeading"]!,
                        TextAlign.left,
                        Colors.black87,
                        40,
                        FontWeight.bold,
                        2,
                        1.05),
                    imageWidget("weather-forecast.jpg"),
                    flexibleText(bottomPadding(24.0), "01", TextAlign.left,
                        Colors.grey[400]!, 48, FontWeight.bold, 0, 1),
                    flexibleText(
                        bottomPadding(8.0),
                        contentText["titlePanduan1"]!,
                        TextAlign.left,
                        Colors.black87,
                        32,
                        FontWeight.w600,
                        2,
                        1),
                    flexibleText(
                        bottomPadding(24.0),
                        contentText["panduan1"]!,
                        TextAlign.left,
                        Colors.black87,
                        16,
                        FontWeight.normal,
                        2,
                        1.5),
                    imageWidget("bag.jpg"),
                    flexibleText(bottomPadding(24.0), "02", TextAlign.left,
                        Colors.grey[400]!, 48, FontWeight.bold, 0, 1),
                    flexibleText(
                        bottomPadding(8.0),
                        contentText["titlePanduan2"]!,
                        TextAlign.left,
                        Colors.black87,
                        32,
                        FontWeight.w600,
                        2,
                        1),
                    flexibleText(
                        bottomPadding(24.0),
                        contentText["panduan2"]!,
                        TextAlign.left,
                        Colors.black87,
                        16,
                        FontWeight.normal,
                        2,
                        1.5),
                    submitBtn,
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
