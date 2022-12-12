import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/model/weather.dart';

class Panduan {
  Weather weather;

  Panduan({required this.weather});

  String panduanBerangkat() {
    String penerbangan = "";
    String kondisiAsal = "";

    if (weather.icon.substring(0, 2) == "01") {
      penerbangan = "Cuaca yang bagus untuk berangkat";
    } else if (weather.icon.substring(0, 1) == "0") {
      penerbangan = "Cuaca berawan, tetapi tidak akan mengganggu perjalanan";
    } else {
      String status = weather.icon.substring(0, 2);
      if (status == "10") {
        kondisiAsal = "hujan";
      } else if (status == "11") {
        kondisiAsal = "badai";
      } else if (status == "13") {
        kondisiAsal = "bersalju";
      } else {
        kondisiAsal = "berkabut";
      }
      penerbangan =
          "Karena cuaca $kondisiAsal, kemungkinan jadwal penerbangan ditunda";
    }
    return penerbangan;
  }

  Map<String, String> panduanWisata() {
    Map<String, String> panduan = {};
    if (weather.temp >= 27) {
      panduan["thermometer"] = "Cuaca di kota destinasi cukup panas";
      panduan["case"] =
          "Membawa pakaian yang mudah menyerap keringat, seperti baju kaus";
      panduan["water"] = "Jangan lupa membawa wadah minum!";
      panduan["umbrella"] = "Membawa payung anti sinar UV atau topi";
    } else {
      panduan["thermometer"] = "Cuaca di kota destinasi cukup dingin";
      panduan["case"] =
          "Membawa pakaian hangat, seperti jaket, sweater, atau baju lengan panjang";
    }

    if (weather.clouds >= 65) {
      panduan["umbrella"] =
          "Tempat wisata berpotensi hujan, jangan lupa membawa payung";
    }

    String iconKondisi = "";
    String deskripsi = "";
    if (weather.icon.substring(0, 2) == "01") {
      panduan["sunny"] = "Cuaca yang bagus untuk pergi wisata!";
    } else if (weather.icon.substring(0, 1) == "0") {
      panduan["cloud"] =
          "Cuaca berawan, tetapi tidak akan mengganggu perjalanan";
    } else {
      String status = weather.icon.substring(0, 2);
      if (status == "10") {
        iconKondisi = "rain";
        deskripsi = "hujan";
      } else if (status == "11") {
        iconKondisi = "thunderstorm";
        deskripsi = "badai";
      } else if (status == "13") {
        iconKondisi = "snow";
        deskripsi = "bersalju";
      } else {
        deskripsi = "buruk";
      }
      panduan[iconKondisi] =
          "Karena cuaca $deskripsi, tunda jalan-jalan dahulu, mungkin di lain hari akan kembali cerah";
    }

    return panduan;
  }
}
