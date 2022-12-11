import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wisata_nusantara_mobile/apps/daftar_event/models/Event.dart';

Future<List<Event>> fetchEvent() async {
  var url = Uri.parse("https://wisata-nusa.up.railway.app/event/json/");
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Event> listEvent = [];
  for (var d in data) {
    if (d != null) {
      listEvent.add(Event.fromJson(d));
    }
  }
  return listEvent;
}
