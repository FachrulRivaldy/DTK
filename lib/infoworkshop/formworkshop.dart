import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infoworkshop/databankworkshop.dart';
import 'package:dtk_database_tekkom/infoworkshop/pageinfoworkshop.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class FormWorkshop extends StatefulWidget {
  @override
  _FormWorkshopState createState() => _FormWorkshopState();
}

class _FormWorkshopState extends State<FormWorkshop> {
  String? namaWorkshop, penyelenggaraWorkshop, skalaWorkshop, tanggalWorkshop;
  int? hargaWorkshop;
  String iconArrow = "";

  getNamaWorkshop(nama) {
    this.namaWorkshop = nama;
  }

  getPenyelenggaraWorkshop(penyelenggara) {
    this.penyelenggaraWorkshop = penyelenggara;
  }

  getSkalaWorkshop(skala) {
    this.skalaWorkshop = skala;
  }

  getTanggalWorkshop(tanggal) {
    this.tanggalWorkshop = tanggal;
  }

  getHargaWorkshop(harga) {
    this.hargaWorkshop = int.parse(harga);
  }

  createData() {
    print("Data Created");

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("databaseworkshop")
        .doc(namaWorkshop);

    // create Map
    Map<String, dynamic> lomba = {
      "Nama": namaWorkshop,
      "Penyelenggara": penyelenggaraWorkshop,
      "Skala": skalaWorkshop,
      "Tanggal": tanggalWorkshop,
      "Harga": hargaWorkshop,
      "Publish": false,
    };

    documentReference.set(lomba).whenComplete(() {
      print("$namaWorkshop created");
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
                    "TAMBAH INFO WORKSHOP",
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
                          labelText: "Nama Workshop",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50))),
                      onChanged: (String? nama) {
                        getNamaWorkshop(nama);
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
                            labelText: "Penyelenggara Workshop",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(50))),
                        onChanged: (String? penyelenggara) {
                          getPenyelenggaraWorkshop(penyelenggara);
                        }),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Skala Workshop'),
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
                              value: skalaWorkshop,
                              isDense: true,
                              isExpanded: true,
                              dropdownColor: Colors.white,
                              items: [
                                DropdownMenuItem(
                                    child: Text("Pilih Skala Workshop"),
                                    value: ""),
                                DropdownMenuItem(
                                    child: Text("Nasional"), value: "Nasional"),
                                DropdownMenuItem(
                                    child: Text("Internasional"),
                                    value: "Internasional"),
                              ],
                              onChanged: (String? skala) {
                                getSkalaWorkshop(skala);
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
                          getHargaWorkshop(harga);
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
                          getTanggalWorkshop(tanggal);
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
                      hinttext: "Back",
                      iconArrow: "Left",
                      dest: InfoWorkshop()),
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
                              builder: (context) => DatabankWorkshop()),
                        );
                        createData();
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
