import 'dart:convert';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    // required this.pk,
    required this.nama,
    required this.lokasi,
    required this.jenis,
    required this.deskripsi,
    required this.foto,
  });

  // int pk;
  String nama;
  String lokasi;
  String jenis;
  String deskripsi;
  String foto;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        // pk: json["pk"],
        nama: json["fields"]["nama"],
        lokasi: json["fields"]["lokasi"],
        jenis: json["fields"]["jenis"],
        deskripsi: json["fields"]["deskripsi"],
        foto: json["fields"]["foto"],
      );

  Map<String, dynamic> toJson() => {
        // "pk": pk,
        "nama": nama,
        "lokasi": lokasi,
        "jenis": jenis,
        "deskripsi": deskripsi,
        "foto": foto,
      };
}

List<Event> events = [
  Event(
    nama: 'JKTGO Fantasia 2022',
    lokasi: 'Jakarta Utara',
    jenis: 'Lainnya',
    deskripsi:
        'JKTGO Halloween Night kembali dengan tema JKTGO Fantasia. Bawa diri anda ke petualangan yang menegangkan bersama sahabat dan keluarga. Nikmati wahana YANG HARUS ANDA COBA: Wizard World, Tunnel of Love, Scare Zone: Rumah Hantu, Zombie Run, dan The Village, Paranormal Experience by Pandora.',
    foto:
        'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit19201280gsm/events/2022/10/17/927ca61c-8359-4ba9-8cba-4b5064d2d56a-1665980500349-5e28911a514f135483529f7117b26a3d.jpg',
  ),
  Event(
    nama: 'Teater Musikal Cek Toko Sebelah',
    lokasi: 'Jakarta Pusat',
    jenis: 'Lainnya',
    deskripsi:
        'Sebuah pertunjukan teater musikal karya Jakarta Movin, adaptasi dari film Cek Toko Sebelah karya Ernest Prakasa.',
    foto:
        'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit19201280gsm/events/2022/11/14/0859bfac-efb6-4ab1-b476-70cf8b1d72b5-1668391000444-54627018ea9e3992e82f3c78d5a612e5.jpeg',
  ),
  Event(
    nama: 'Festival Danau Sentarum',
    lokasi: 'Kalimantan Barat',
    jenis: 'Budaya',
    deskripsi:
        'Rangkaian acara yang akan diadakan adalah Parade Minum Madu, Lomba Sampan Bidar, Pameran Ekonomi Kreatif Produk Masyarakat UMKM , Karnaval Budaya Khas Kapuas Hulu, Musik Etnik Kapuas Hulu, dan masih banyak lagi.',
    foto:
        'https://www.indonesia.travel/content/dam/indtravelrevamp/microsite-event/story-of-event/festival-budaya-di-2022/sentarum.jpg',
  ),
];
