import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infolomba/databanklomba.dart';
import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'variablelomba.dart';
import 'package:flutter/material.dart';

class FormLomba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*TextEditingController namacontroller = TextEditingController(text: '');
    TextEditingController penyelenggaracontroller =
        TextEditingController(text: '');
    TextEditingController skalacontroller = TextEditingController(text: '');
    TextEditingController biayacontroller = TextEditingController(text: '');
    TextEditingController tanggalcontroller = TextEditingController(text: '');*/

    return SafeArea(
      child: Scaffold(
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
                    "TAMBAH INFO LOMBA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            KolomFormInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LongButton(
                      hinttext: "Back", iconArrow: "Left", dest: InfoLomba()),
                  SubmitLomba(
                      hinttext: "Submit",
                      iconArrow: "Right",
                      dest: DatabankLomba())
                  /*LongButton(
                      hinttext: "Submit",
                      iconArrow: "None",
                      dest: DatabankLomba())*/
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class KolomFormInfo extends StatelessWidget {
  /*final TextEditingController namacontroller;
  final TextEditingController penyelenggaracontroller;
  final TextEditingController skalacontroller;
  final TextEditingController biayacontroller;
  final TextEditingController tanggalcontroller;*/
  String? skala;
  String? nama;
  String? penyelenggara;
  String? tanggal;
  String? harga;
  //final TextEditingController postercontroller;

  KolomFormInfo({
    /*required this.namacontroller,
    required this.penyelenggaracontroller,
    required this.skalacontroller,
    required this.biayacontroller,
    required this.tanggalcontroller,*/
    this.skala = '',
    this.nama = '',
    this.penyelenggara = '',
    this.tanggal = '',
    this.harga = '',
    //required this.postercontroller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 450,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.yellow),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldLombaString(
              isianform: nama,
              height: 40,
              hinttext: "Nama",
              destination: ControllerName.isinamalomba,
            ),
            FieldLombaString(
              isianform: penyelenggara,
              height: 40,
              hinttext: "Penyelenggara",
              destination: ControllerName.isipenyelenggara,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Skala'),
                  InputDecorator(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: skala,
                        isDense: true,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        items: [
                          DropdownMenuItem(
                              child: Text("Pilih Skala lomba"), value: ""),
                          DropdownMenuItem(
                              child: Text("Nasional"), value: "Nasional"),
                          DropdownMenuItem(
                              child: Text("Internasional"),
                              value: "Internasional"),
                        ],
                        onChanged: (value) {
                          ControllerName.isiskala = value;
                          print(ControllerName.isiskala);
                        },
                      ),
                    ),
                  ),
                ]),
            FieldLombaString(
              isianform: harga,
              height: 40,
              hinttext: "Biaya Pendaftaran",
              destination: ControllerName.isiharga,
            ),
            FieldLombaString(
              isianform: tanggal,
              height: 40,
              hinttext: "Tanggal Pelaksanaan",
              destination: ControllerName.isitanggal,
            ),
            SizedBox(
              height: 15,
              child: Text("Upload Poster"),
            ),
            UploadPhoto(),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    ));
  }
}

// ignore: must_be_immutable
class FieldLombaStringa extends StatelessWidget {
  final String hinttext;
  final bool isobscure;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontweight;
  final double height;
  var destination;
  var isianform;

  FieldLombaStringa({
    required this.controller,
    required this.destination,
    this.hinttext = '',
    this.isobscure = false,
    this.fontsize = 14,
    this.textcolor = Colors.black,
    this.fontweight = FontWeight.normal,
    this.height = 50,
  });

  TextEditingController controller;

  createData(isianform) {
    this.destination = isianform;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textcolor,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
      controller: controller,
      obscureText: isobscure,
      maxLines: 1,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: hinttext,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50))),
      onChanged: (String value) {
        isianform = value;
        createData(isianform);
      },
    ); //,
    //);
  }
}

// ignore: must_be_immutable
class FieldLombaString extends StatelessWidget {
  final String hinttext;
  final bool isobscure;
  final Color textcolor;
  final double fontsize;
  final FontWeight fontweight;
  final double height;
  var destination;
  var isianform;

  FieldLombaString({
    required this.destination,
    required this.isianform,
    this.hinttext = '',
    this.isobscure = false,
    this.fontsize = 14,
    this.textcolor = Colors.black,
    this.fontweight = FontWeight.normal,
    this.height = 50,
  });

  createData(isianform) {
    this.destination = isianform;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: textcolor,
        fontSize: fontsize,
        fontWeight: fontweight,
      ),
      obscureText: isobscure,
      maxLines: 1,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: hinttext,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(50))),
      onChanged: (String value) {
        isianform = value;
        createData(isianform);
      },
    ); //,
    //);
  }
}

class SubmitLomba extends StatelessWidget {
  final String hinttext;
  final String iconArrow;
  final Widget dest;
  final double width;

  SubmitLomba(
      {required this.hinttext,
      required this.iconArrow,
      required this.dest,
      this.width = 100});

  sendData() {
    print("Submitted");

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("databanklomba")
        .doc(ControllerName.isinamalomba);

    // ignore: unnecessary_statements
    Map<String, dynamic> lomba = {
      "Nama": ControllerName.isinamalomba,
      "Penyelenggara": ControllerName.isipenyelenggara,
      "Skala": ControllerName.isiskala,
      "Tanggal": ControllerName.isitanggal,
      "Harga": ControllerName.isiharga,
    };

    documentReference.set(lomba).whenComplete(() {
      print("$ControllerName.isinamalomba created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconArrow == "None")
              if (iconArrow == "Left") Icon(Icons.arrow_left),
            Text(hinttext),
            if (iconArrow == "Right") Icon(Icons.arrow_right),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => dest));
          sendData();
        },
      ),
    );
  }
}
