import 'package:provider/provider.dart';
import 'package:wisata_nusantara_mobile/apps/cerita_perjalanan/model/story.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

    Future<List<Story>> fetchStory() async {
      var url = Uri.parse('https://wisata-nusantara.up.railway.app/story/json/');
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
      List<Story> listStory= [];
      for (var d in data) { 
        if (d != null) {
          listStory.add(Story.fromJson(d));
        }
      }

      return listStory;
  }
  addStory(BuildContext context, String review) async {
  final request = context.read<CookieRequest>();

  String url = 'https://wisata-nusantara.up.railway.app/story/submit_json/';
  var response = await request.post(
      url,
      {
        "review": review,
      }
  );
}