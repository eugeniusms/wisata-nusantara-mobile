import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/models/Destination.dart';

Future<List<Destination>> fetchDestination() async {
  var url =
      Uri.parse('https://wisata-nusantara.herokuapp.com/destination/json/');
  var response = await http.get(url, headers: {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  });
  print(response.body);
  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  // print(data);

  // melakukan konversi data json menjadi object ToDo
  List<Destination> listDestination = [];
  for (var d in data) {
    if (d != null) {
      listDestination.add(Destination.fromJson(d));
    }
  }

  return listDestination;
}

// REFERENCES
// 1) https://stackoverflow.com/questions/65630743/how-to-solve-flutter-web-api-cors-error-only-with-dart-code