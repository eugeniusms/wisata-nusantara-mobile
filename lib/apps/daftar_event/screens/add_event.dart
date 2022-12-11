import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/daftar_event/components/drawer_event.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  String nama = "";
  String lokasi = "";
  String deskripsi = "";
  String foto = "";
  String _selected = 'Semuanya';
  // List<String> listcategory = [
  //   'Semuanya',
  //   'Musik',
  //   'Olahraga',
  //   'Budaya',
  //   'Lainnya'
  // ];
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Semuanya"), value: "Semuanya"),
      DropdownMenuItem(child: Text("Musik"), value: "Musik"),
      DropdownMenuItem(child: Text("Olahraga"), value: "Olahraga"),
      DropdownMenuItem(child: Text("Budaya"), value: "Budaya"),
      DropdownMenuItem(child: Text("Lainnya"), value: "Lainnya"),
    ];
    return menuItems;
  }

  // Future<void> onPressed(BuildContext context) async {
  //   final request = context.read<CookieRequest>();
  // }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Add Event'),
          backgroundColor: Color.fromARGB(255, 9, 42, 59),
        ),
        drawer: buildEventDrawer(context),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Add New Event!',
                  style: TextStyle(
                    fontSize: 30.0,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: height * 0.05),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nama Event', hintText: "Contoh : JKTGO 22"),
                  onChanged: (String? value) {
                    setState(() {
                      nama = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      nama = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama event tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Lokasi Event',
                      hintText: "Contoh : Jakarta Pusat"),
                  onChanged: (String? value) {
                    setState(() {
                      lokasi = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      lokasi = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Lokasi event tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                DropdownButton(
                    value: _selected,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selected = newValue!;
                      });
                    },
                    items: dropdownItems),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Deskripsi Event',
                      hintText:
                          "Contoh : Festival musik yang akan diisi berbagai musisi"),
                  onChanged: (String? value) {
                    setState(() {
                      deskripsi = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      deskripsi = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi event tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'URL Foto',
                      hintText:
                          "Contoh : https://whatsnewindonesia.com/sites/default/files/inline-images/JKTGO%20FANTASIA.jpg"),
                  onChanged: (String? value) {
                    setState(() {
                      foto = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      foto = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'URL Foto event tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: const Text("Add New Event",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
