import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class PrestasiATK extends StatelessWidget {
  const PrestasiATK({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "PRESTASI ANAK TK",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(children: [
                DataPrestasi(
                  namalomba: "JUARA 1 KRTI",
                ),
                DataPrestasi(
                  namalomba: "JUARA 1 MAGE 7",
                )
              ]),
            ),
            Container(
              height: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LongButton(
                      hinttext: "Back", iconArrow: "Left", dest: MainMenu()),
                  SizedBox(
                    width: 15,
                  ),
                  RoundedButton(symbol: "Plus", dest: MainMenu())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DataPrestasi extends StatelessWidget {
  final String namalomba;
  final String anggota1;
  final String anggota2;
  final String anggota3;
  final String anggota4;
  final String anggota5;

  DataPrestasi({
    required this.namalomba,
    this.anggota1 = '',
    this.anggota2 = '',
    this.anggota3 = '',
    this.anggota4 = '',
    this.anggota5 = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.yellow),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  namalomba,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image:
                              DecorationImage(image: NetworkImage(anggota1))),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image:
                              DecorationImage(image: NetworkImage(anggota1))),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image:
                              DecorationImage(image: NetworkImage(anggota1))),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image:
                                DecorationImage(image: NetworkImage(anggota1))),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image:
                                DecorationImage(image: NetworkImage(anggota1))),
                      )
                    ]),
              ])),
    );
  }
}
