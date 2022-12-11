import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_destinasi/components/DestinasiDrawer.dart';

// merupakan halaman form budget
class DestinasiFormPage extends StatefulWidget {
  const DestinasiFormPage({super.key});

  @override
  State<DestinasiFormPage> createState() => _DestinasiFormPageState();
}

// merupakan halaman dengan state form budget page
class _DestinasiFormPageState extends State<DestinasiFormPage> {
  // inisiasi variabel form
  final _formKey = GlobalKey<FormState>();
  String _nama = "";
  String _deskripsi = "";
  String _lokasi = "";
  String _kategori = "";
  String _foto_thumbnail_url = "";
  String _foto_cover_url = "";
  String _maps_url = "";

  final _coNama = TextEditingController();
  final _coDeskripsi = TextEditingController();
  final _coLokasi = TextEditingController();
  final _coKategori = TextEditingController();
  final _coFotoThumbnailUrl = TextEditingController();
  final _coFotoCoverUrl = TextEditingController();
  final _coMapsUrl = TextEditingController();

  // method yang digunakan untuk clearing state dari form
  void clearInput() {
    _coNama.clear();
    _coDeskripsi.clear();
    _coLokasi.clear();
    _coKategori.clear();
    _coFotoThumbnailUrl.clear();
    _coFotoCoverUrl.clear();
    _coMapsUrl.clear();

    setState(() {
      _nama = "";
      _deskripsi = "";
      _lokasi = "";
      _kategori = "";
      _foto_thumbnail_url = "";
      _foto_cover_url = "";
      _maps_url = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // nama dari app bar adalah form budget
        title: const Text('Add Destination'),
      ),
      // menambahkan Drawer untuk navigasi antarhalaman
      drawer: buildDestinasiDrawer(context),
      // menambahkan form
      body: Form(
          key: _formKey,
          child: Container(
              // menambahkan padding sebesar 25 ke setiap sisi
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Padding(
                      // menambahkan padding sebesar 10 pixel ke setiap sisi
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          // alignment yang digunakan adalah center
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ====================================== JUDUL ===================================
                            // menambahkan form field nama
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText: "Example: Candi Prambanan",
                                labelText: "Name",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coNama,
                              // mengubah state isi dari judul sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _nama = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari judul sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _nama = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus judul kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name cannot be empty!';
                                }
                                return null;
                              },
                            ),
                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),
                            // ====================================== DESKRIPSI ===================================
                            // menambahkan form field deskripsi
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText: "Example: Candi Prambanan is a ...",
                                labelText: "Description",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coDeskripsi,
                              // mengubah state isi dari deskripsi sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _deskripsi = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari deskripsi sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _deskripsi = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus deskripsi kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description cannot be empty!';
                                }
                                return null;
                              },
                            ),

                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),
                            // ====================================== LOKASI ===================================
                            // menambahkan form field lokasi
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText: "Example: Yogyakarta",
                                labelText: "Location",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coLokasi,
                              // mengubah state isi dari lokasi sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _lokasi = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari lokasi sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _lokasi = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus lokasi kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Location cannot be empty!';
                                }
                                return null;
                              },
                            ),

                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),

                            // ====================================== KATEGORI ===================================
                            // menambahkan form field kategori
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText: "Example: Culture",
                                labelText: "Category",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coKategori,
                              // mengubah state isi dari kategori sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _kategori = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari kategori sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _kategori = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus kategori kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Category cannot be empty!';
                                }
                                return null;
                              },
                            ),

                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),

                            // ====================================== FOTO THUMBNAIL URL ===================================
                            // menambahkan form field foto thumbnail url
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText:
                                    // example from pinterest
                                    "Example: https://i.pinimg.com/564x/1c/1c/1c/1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c.jpg",
                                labelText: "Thumbnail Photo URL",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coFotoThumbnailUrl,
                              // mengubah state isi dari foto thumbnail url sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _foto_thumbnail_url = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari foto thumbnail url sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _foto_thumbnail_url = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus foto thumbnail url kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Thumbnail Photo URL cannot be empty!';
                                }
                                return null;
                              },
                            ),

                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),

                            // ====================================== FOTO COVER URL ===================================
                            // menambahkan form field foto cover url
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText:
                                    "Example: https://i.pinimg.com/564x/1c/1c/1c/1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c1c.jpg",
                                labelText: "Cover Photo URL",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coFotoCoverUrl,
                              // mengubah state isi dari foto cover url sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _foto_cover_url = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari foto cover url sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _foto_cover_url = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus foto cover url kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Cover Photo URL cannot be empty!';
                                }
                                return null;
                              },
                            ),

                            // menambahkan jarak setinggi 15 pixel
                            const SizedBox(
                              height: 15,
                            ),

                            // ====================================== MAPS URL ===================================
                            // menambahkan form field maps url
                            TextFormField(
                              // menambahkan decoration saat form belum diisi
                              decoration: InputDecoration(
                                hintText:
                                    "Example: https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.657384253948!2d106.82415431476932!3d-6.175667995496159!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69fbd2f0f4f8c5%3A0x2f0f4f8c5f0f4f8c5!2sJl.%20Kebon%20Jeruk%20Raya%20No.1%2C%20RT.1%2FRW.3%2C%20Kb.%20Jeruk%2C%20Kec.%20Kb.%20Jeruk%2C%20Kota%20Jakarta%20Barat%2C%20Daerah%20Khusus%20Ibukota%20Jakarta%2011210!5e0!3m2!1sid!2sid!4v1626123456789!5m2!1sid!2sid",
                                labelText: "Maps URL",
                                // menambahkan rounded border sebesar 10 pixel
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              controller: _coMapsUrl,
                              // mengubah state isi dari maps url sesuai value ketika ada perubahan
                              onChanged: (String? value) {
                                setState(() {
                                  _maps_url = value!;
                                });
                              },
                              // ketika onSaved maka akan mengubah state isi dari maps url sesuai value
                              onSaved: (String? value) {
                                setState(() {
                                  _maps_url = value!;
                                });
                              },
                              // melakukan validasi form untuk kasus maps url kosong
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Maps URL cannot be empty!';
                                }
                                return null;
                              },
                            ),
                          ])),

                  // Menambahkan Spacer
                  const Spacer(),
                  // ====================================== BUTTON ===================================
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      onPressed: () {
                        // melakukan validasi form saat button onPressed
                        if (_formKey.currentState!.validate() &&
                            _nama != "" &&
                            _deskripsi != "" &&
                            _lokasi != "" &&
                            _kategori != "" &&
                            _foto_thumbnail_url != "" &&
                            _foto_cover_url != "" &&
                            _maps_url != "") {
                          print(_nama);
                          print(_deskripsi);
                          print(_lokasi);
                          print(_kategori);
                          print(_foto_thumbnail_url);
                          print(_foto_cover_url);
                          print(_maps_url);
                          // menampilkan toast saat valid
                          _showToast(context, true);
                          clearInput();
                        } else {
                          _showToast(context, false);
                        }
                      },
                      // button
                      child: const Text(
                        "Add Destination",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  // menampilkan toast saat valid dan tidak valid
  void _showToast(BuildContext context, bool isValid) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        // saat valid maka warna hijau, sebaliknya merah
        backgroundColor: isValid ? Colors.green : Colors.red,
        // saat valid maka text menampilkan 'Budget berhasil disimpan', sebaliknya 'Isian masih belum lengkap :)'
        content: Text(isValid
            ? "Destination successfully saved"
            : "Form is not complete yet!"),
        // menambahkan actio
        action: SnackBarAction(
            label: 'Close',
            textColor: Colors.white,
            onPressed: () {
              scaffold.hideCurrentSnackBar;
            }),
      ),
    );
  }
}
