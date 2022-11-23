// To parse this JSON data
import 'dart:convert';

List<Destination> todoFromJson(String str) => List<Destination>.from(
    json.decode(str).map((x) => Destination.fromJson(x)));

String todoToJson(List<Destination> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Destination {
  Destination({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.lokasi,
    required this.kategori,
    required this.foto_thumbnail_url,
    required this.foto_cover_url,
    required this.maps_url,
    required this.jumlah_suka,
    required this.created_by,
  });

  int id;
  String nama;
  String deskripsi;
  String lokasi;
  String kategori;
  String foto_thumbnail_url;
  String foto_cover_url;
  String maps_url;
  int jumlah_suka;
  String created_by;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["pk"],
        nama: json["fields"]["nama"],
        deskripsi: json["fields"]["deskripsi"],
        lokasi: json["fields"]["lokasi"],
        kategori: json["fields"]["kategori"],
        foto_thumbnail_url: json["fields"]["foto_thumbnail_url"],
        foto_cover_url: json["fields"]["foto_cover_url"],
        maps_url: json["fields"]["maps_url"],
        jumlah_suka: json["fields"]["jumlah_suka"],
        created_by: json["fields"]["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "lokasi": lokasi,
        "kategori": kategori,
        "foto_thumbnail_url": foto_thumbnail_url,
        "foto_cover_url": foto_cover_url,
        "maps_url": maps_url,
        "jumlah_suka": jumlah_suka,
        "created_by": created_by,
      };
}
