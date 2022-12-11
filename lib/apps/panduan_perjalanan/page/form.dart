import 'package:flutter/material.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/model/weather.dart';
import 'package:wisata_nusantara_mobile/apps/panduan_perjalanan/page/panduan.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _kotaAsal = "";
  String _kotaTujuan = "";

  @override
  Widget build(BuildContext context) {
    final submitBtn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Weather.setKota(_kotaAsal, _kotaTujuan);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PanduanPerjalanan(
                kotaAsal: _kotaAsal,
                kotaTujuan: _kotaTujuan,
              );
            }));
          }
        },
        child: const Text('Submit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );

    final kotaAsalForm = Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Kota Asal",
          // hintText: "Kota Asal",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _kotaAsal = value!;
          });
        },
        onSaved: (String? value) {
          setState(() {
            _kotaAsal = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Kota Asal tidak boleh kosong";
          }
          return null;
        },
      ),
    );
    final kotaTujuanForm = Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Kota Tujuan",
          // hintText: "Kota Tujuan",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _kotaTujuan = value!;
          });
        },
        onSaved: (String? value) {
          setState(() {
            _kotaTujuan = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Kota Tujuan tidak boleh kosong";
          }
          return null;
        },
      ),
    );

    Image image() {
      return Image.asset(
        "assets/images/panduan-perjalanan/travel-map.jpg",
        height: 250,
      );
    }

    Widget flexibleText(String text, double size, FontWeight fweight) {
      return Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: fweight,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    final containerForm = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(child: image()),
          SizedBox(height: 4),
          flexibleText("Mulai pandu perjalanan!", 24, FontWeight.w600),
          flexibleText(
              "Hanya perlu mengisi form dengan kota keberangkatan dan kota destinasi",
              18,
              FontWeight.normal),
          kotaAsalForm,
          kotaTujuanForm,
          submitBtn,
        ],
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(hasScrollBody: false, child: containerForm)
            ],
          ),
        ),
      ),
    );
  }
}
