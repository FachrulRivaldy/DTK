import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/formtemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class FormInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController namacontroller = TextEditingController(text: '');
    TextEditingController penyelenggaracontroller =
        TextEditingController(text: '');
    TextEditingController skalacontroller = TextEditingController(text: '');
    TextEditingController biayacontroller = TextEditingController(text: '');
    TextEditingController tanggalcontroller = TextEditingController(text: '');

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
            KolomFormInfo(
                namacontroller: namacontroller,
                penyelenggaracontroller: penyelenggaracontroller,
                skalacontroller: skalacontroller,
                biayacontroller: biayacontroller,
                tanggalcontroller: tanggalcontroller),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LongButton(
                      hinttext: "Back", iconArrow: "Left", dest: InfoLomba()),
                  LongButton(
                      hinttext: "Submit", iconArrow: "None", dest: InfoLomba())
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

class KolomFormInfo extends StatelessWidget {
  final TextEditingController namacontroller;
  final TextEditingController penyelenggaracontroller;
  final TextEditingController skalacontroller;
  final TextEditingController biayacontroller;
  final TextEditingController tanggalcontroller;
  //final TextEditingController postercontroller;

  KolomFormInfo({
    required this.namacontroller,
    required this.penyelenggaracontroller,
    required this.skalacontroller,
    required this.biayacontroller,
    required this.tanggalcontroller,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Formnya(
              controller: namacontroller,
              height: 40,
            ),
            Formnya(
              controller: penyelenggaracontroller,
              height: 40,
            ),
            Formnya(
              controller: skalacontroller,
              height: 40,
            ),
            Formnya(
              controller: biayacontroller,
              height: 40,
            ),
            Formnya(
              controller: tanggalcontroller,
              height: 40,
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    ));
  }
}
