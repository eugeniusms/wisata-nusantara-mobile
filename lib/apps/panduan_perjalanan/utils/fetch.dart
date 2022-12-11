import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/model/weather.dart';

String apiKey = "2bf8699a999ba51b8a89cb7600b39312";

Future<Weather> fetchWeather(String kota) async {
  var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$kota&units=metric&appid=$apiKey');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  Weather weather = Weather.fromJson(data);

  return weather;
}
