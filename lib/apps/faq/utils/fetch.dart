// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;
import 'package:wisata_nusantara_mobile/apps/faq/models/private_faq_model.dart';
import 'dart:convert';
import 'package:wisata_nusantara_mobile/apps/faq/models/public_faq_model.dart';
import 'package:wisata_nusantara_mobile/apps/authentication/models/User.dart';

Future<List<PublicFaq>> fetchPublicFAQ() async {
  var url = Uri.parse('https://wisata-nusa.up.railway.app/faq/json/public/');
  var username = UserLoggedIn.user.username;

  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<PublicFaq> listPublicFaq = [];
  for (var d in data) {
    if (d != null) {
      listPublicFaq.add(PublicFaq.fromJson(d));
    }
  }

  return listPublicFaq;
}

Future<List<PrivateFaq>> fetchPrivateFAQ() async {
  var url = Uri.parse('https://wisata-nusa.up.railway.app/faq/json/private/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<PrivateFaq> listPrivateFaq = [];
  for (var d in data) {
    if (d != null) {
      listPrivateFaq.add(PrivateFaq.fromJson(d));
    }
  }
  return listPrivateFaq;
}
