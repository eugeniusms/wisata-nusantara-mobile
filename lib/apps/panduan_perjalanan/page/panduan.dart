import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/model/weather.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/model/panduan.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/utils/fetch.dart';

class PanduanPerjalanan extends StatefulWidget {
  final String kotaAsal;
  final String kotaTujuan;

  const PanduanPerjalanan(
      {super.key, required this.kotaAsal, required this.kotaTujuan});
  final String title = "Panduan Perjalanan";

  @override
  State<PanduanPerjalanan> createState() => _PanduanPerjalananState();
}

class _PanduanPerjalananState extends State<PanduanPerjalanan> {
  final String _kotaAsal = Weather.kotaAsal;
  final String _kotaTujuan = Weather.kotaTujuan;

  Map<String, IconData> iconMap = {
    "thermometer": Icons.thermostat_outlined,
    "case": Icons.cases_outlined,
    "water": Icons.water_drop_outlined,
    "umbrella": Icons.umbrella_outlined,
    "sunny": Icons.wb_sunny_outlined,
    "cloud": Icons.cloud_outlined,
    "snow": Icons.ac_unit_outlined,
    "rain": Icons.cloudy_snowing,
  };

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  Widget header(String city, String date) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 32,
                fontWeight: FontWeight.w600,
                height: 2),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style:
                TextStyle(color: Colors.grey[700], fontSize: 16, height: 1.5),
          ),
        )
      ],
    );
  }

  Widget temperatureWidget(Weather weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
            "assets/images/panduan-perjalanan/weather/${weather.icon}.png",
            width: 80,
            height: 80),
        Flexible(
            child: Column(
          children: [
            Text(
              "${weather.temp.toStringAsFixed(0)}°C",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 40,
              ),
            ),
            Text(
              weather.description,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget boxIcon(String icon) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset("assets/images/panduan-perjalanan/icons/$icon.png"),
    );
  }

  Widget statusDetail(String status, String satuan) {
    return SizedBox(
      height: 20,
      width: 80,
      child: Text(
        "$status $satuan",
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget iconDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        boxIcon("windspeed"),
        boxIcon("humidity"),
        boxIcon("clouds"),
      ],
    );
  }

  Widget weatherDetail(Weather weather) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        statusDetail(weather.windSpeed.toString(), "km/h"),
        statusDetail(weather.humidity.toString(), "%"),
        statusDetail(weather.clouds.toString(), "%"),
      ],
    );
  }

  Widget panduanWisata(Weather weather, bool isDestionation) {
    Panduan panduan = Panduan(weather: weather);
    if (isDestionation) {
      Map<String, String> saran = panduan.panduanWisata();
      return Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            for (var item in saran.entries)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(1, 1, 8, 1),
                      child: Icon(
                        iconMap[item.key] ?? Icons.error_outline,
                        color: Colors.green[900],
                      ),
                    ),
                    Flexible(child: Text(item.value)),
                  ],
                ),
              ),
          ],
        ),
      );
    } else {
      String saran = panduan.panduanBerangkat();
      return Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 1, 8, 1),
                    child: Icon(
                      Icons.airplanemode_active_outlined,
                      color: Colors.green[900],
                    ),
                  ),
                  Flexible(child: Text(saran)),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget pembatas(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget dialogNotif() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: const Text("Kota tidak ditemukan"),
        content: const Text("Silahkan masukkan kota yang benar"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget futureWeather(AsyncSnapshot snapshot, bool isDestination) {
    if (snapshot.data == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      if (!snapshot.hasData) {
        return Column(
          children: const [
            Text(
              "Kota tidak ditemukan :(",
              style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
            ),
            SizedBox(height: 8),
          ],
        );
      } else {
        Weather weatherData = snapshot.data!;
        if (weatherData.cod != 200) {
          return dialogNotif();
        }
        return Column(
          children: [
            temperatureWidget(weatherData),
            pembatas(20),
            iconDetail(),
            weatherDetail(weatherData),
            pembatas(20),
            panduanWisata(weatherData, isDestination),
          ],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime tanggal = DateTime.now();
    String formattedDate =
        DateFormat('MMM dd, yyyy').format(DateTime.parse(tanggal.toString()));
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: const EdgeInsets.all(12.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    header(capitalize(_kotaAsal), formattedDate),
                    FutureBuilder(
                        future: fetchWeather(_kotaAsal),
                        builder: (context, AsyncSnapshot snapshot) {
                          return futureWeather(snapshot, false);
                        }),
                    pembatas(50),
                    header(capitalize(_kotaTujuan), formattedDate),
                    FutureBuilder(
                        future: fetchWeather(_kotaTujuan),
                        builder: (context, AsyncSnapshot snapshot) {
                          return futureWeather(snapshot, true);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
