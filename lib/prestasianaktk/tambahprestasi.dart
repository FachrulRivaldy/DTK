import 'package:dtk_database_tekkom/prestasianaktk/pageprestasi.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
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
              namaanggota5: namaanggota5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LongButton(
                  hinttext: "Back", iconArrow: "Left", dest: PrestasiATK()),
              LongButton(
                  hinttext: "Submit", iconArrow: "None", dest: PrestasiATK())
            ],
          )
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
        height: 450,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Formnya(
                  controller: judulprestasi,
                  height: 35,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhoto(),
                  InputAnggota(
                    controller: namaanggota1,
                    height: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhoto(),
                  InputAnggota(
                    controller: namaanggota2,
                    height: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhoto(),
                  InputAnggota(
                    controller: namaanggota3,
                    height: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhoto(),
                  InputAnggota(
                    controller: namaanggota4,
                    height: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UploadPhoto(),
                  InputAnggota(
                    controller: namaanggota5,
                    height: 35,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              )
              /*Row(
                children: [
                  Column(
                    children: [
                      UploadPhoto(),
                      UploadPhoto(),
                      UploadPhoto(),
                      UploadPhoto(),
                      UploadPhoto(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Formnya(
                        controller: namaanggota1,
                        height: 35,
                      ),
                      Formnya(
                        controller: namaanggota2,
                        height: 35,
                      ),
                      Formnya(
                        controller: namaanggota3,
                        height: 35,
                      ),
                      Formnya(
                        controller: namaanggota4,
                        height: 35,
                      ),
                      Formnya(
                        controller: namaanggota5,
                        height: 35,
                      )
                    ],
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class InputAnggota extends StatelessWidget {
  final String hinttext;
  final bool isobscure;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontweight;
  final double height;

  const InputAnggota({
    required this.controller,
    this.hinttext = '',
    this.isobscure = false,
    this.fontsize = 14,
    this.textcolor = Colors.black,
    this.fontweight = FontWeight.normal,
    this.height = 50,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: 250,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        style: TextStyle(
            color: textcolor, fontSize: fontsize, fontWeight: fontweight),
        controller: controller,
        obscureText: isobscure,
        maxLines: 1,
        decoration:
            InputDecoration(hintText: hinttext, border: InputBorder.none),
      ),
    );
  }
}
