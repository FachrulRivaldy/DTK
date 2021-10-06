import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class TambahPrestasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController judulprestasi = TextEditingController(text: '');
    TextEditingController namaanggota1 = TextEditingController(text: '');
    TextEditingController namaanggota2 = TextEditingController(text: '');
    TextEditingController namaanggota3 = TextEditingController(text: '');
    TextEditingController namaanggota4 = TextEditingController(text: '');
    TextEditingController namaanggota5 = TextEditingController(text: '');
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 350,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45), color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "TAMBAH DATA PRESTASI",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          FormPrestasi(
              judulprestasi: judulprestasi,
              namaanggota1: namaanggota1,
              namaanggota2: namaanggota2,
              namaanggota3: namaanggota3,
              namaanggota4: namaanggota4,
              namaanggota5: namaanggota5)
        ],
      ),
    ));
  }
}

class FormPrestasi extends StatelessWidget {
  final TextEditingController judulprestasi;
  final TextEditingController namaanggota1;
  final TextEditingController namaanggota2;
  final TextEditingController namaanggota3;
  final TextEditingController namaanggota4;
  final TextEditingController namaanggota5;

  FormPrestasi({
    required this.judulprestasi,
    required this.namaanggota1,
    required this.namaanggota2,
    required this.namaanggota3,
    required this.namaanggota4,
    required this.namaanggota5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Formnya(
                controller: judulprestasi,
                height: 35,
              ),
              Row(
                children: [UploadPhoto(), Formnya(controller: namaanggota1)],
              ),
              Row(
                children: [UploadPhoto(), Formnya(controller: namaanggota2)],
              ),
              Row(
                children: [UploadPhoto(), Formnya(controller: namaanggota3)],
              ),
              Row(
                children: [UploadPhoto(), Formnya(controller: namaanggota4)],
              ),
              Row(
                children: [UploadPhoto(), Formnya(controller: namaanggota5)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
