import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infolomba/databanklomba.dart';
import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class FormLomba extends StatefulWidget {
  @override
  _FormLombaState createState() => _FormLombaState();
}

class _FormLombaState extends State<FormLomba> {
  String? namaLomba, penyelenggaraLomba, skalaLomba, tanggalLomba;
  int? hargaLomba;
  String iconArrow = "";

  getNamaLomba(nama) {
    this.namaLomba = nama;
  }

  getPenyelenggaraLomba(penyelenggara) {
    this.penyelenggaraLomba = penyelenggara;
  }

  getSkalaLomba(skala) {
    this.skalaLomba = skala;
  }

  getTanggalLomba(tanggal) {
    this.tanggalLomba = tanggal;
  }

  getHargaLomba(harga) {
    this.hargaLomba = int.parse(harga);
  }

  createData() {
    print("Data Created");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("databanklomba").doc(namaLomba);

    // create Map
    Map<String, dynamic> lomba = {
      "Nama": namaLomba,
      "Penyelenggara": penyelenggaraLomba,
      "Skala": skalaLomba,
      "Tanggal": tanggalLomba,
      "Harga": hargaLomba,
    };

    documentReference.set(lomba).whenComplete(() {
      print("$namaLomba created");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
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
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Nama Lomba",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50))),
                      onChanged: (String? nama) {
                        getNamaLomba(nama);
                      },
                    ),
                    TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Penyelenggara Lomba",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50))),
                        onChanged: (String? penyelenggara) {
                          getPenyelenggaraLomba(penyelenggara);
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Skala Lomba'),
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
                              value: skalaLomba,
                              isDense: true,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              items: [
                                DropdownMenuItem(
                                    child: Text("Pilih Skala lomba"),
                                    value: ""),
                                DropdownMenuItem(
                                    child: Text("Nasional"), value: "Nasional"),
                                DropdownMenuItem(
                                    child: Text("Internasional"),
                                    value: "Internasional"),
                              ],
                              onChanged: (String? skala) {
                                getSkalaLomba(skala);
                              },
                            )))
                      ],
                    ),
                    TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Biaya Pendaftaran",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50))),
                        onChanged: (harga) {
                          getHargaLomba(harga);
                        }),
                    TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Tanggal Pelaksanaan",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50))),
                        onChanged: (String? tanggal) {
                          getTanggalLomba(tanggal);
                        }),
                    SizedBox(
                      height: 15,
                      child: Text("Upload Poster"),
                    ),
                    UploadPhoto(),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LongButton(
                      hinttext: "Back", iconArrow: "Left", dest: InfoLomba()),
                  Container(
                    alignment: Alignment.center,
                    width: 101,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (iconArrow == "None")
                            if (iconArrow == "Left") Icon(Icons.arrow_left),
                          Text("Submit"),
                          if (iconArrow == "Right") Icon(Icons.arrow_right),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DatabankLomba()),
                        );
                        createData();

                        /*databanklomba.add({
                          "Nama": namacontroller.text,
                          "Penyelenggara": penyelenggaracontroller.text,
                          "Skala": skalacontroller.text,
                          "Tanggal": tanggalcontroller.text,
                          "Harga": int.tryParse(biayacontroller.text) ?? 0,
                        });*/

                        /*namacontroller.text = '';
                            penyelenggaracontroller.text = '';
                            skalacontroller.text = '';
                            tanggalcontroller.text = '';
                            biayacontroller.text = '';*/
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
