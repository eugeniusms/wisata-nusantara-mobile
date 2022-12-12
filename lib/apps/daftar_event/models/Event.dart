import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.pk,
    required this.nama,
    required this.lokasi,
    required this.jenis,
    required this.deskripsi,
    required this.foto,
  });

  int pk;
  String nama;
  String lokasi;
  String jenis;
  String deskripsi;
  String foto;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        pk: json["pk"],
        nama: json["fields"]["nama"],
        lokasi: json["fields"]["lokasi"],
        jenis: json["fields"]["jenis"],
        deskripsi: json["fields"]["deskripsi"],
        foto: json["fields"]["foto"],
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "nama": nama,
        "lokasi": lokasi,
        "jenis": jenis,
        "deskripsi": deskripsi,
        "foto": foto,
      };
}
