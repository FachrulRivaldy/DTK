import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:dtk_database_tekkom/prestasianaktk/formprestasi.dart';
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
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return DataPrestasi(namalomba: "JUARA 1 LOMBA A");
                    })),
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
                  RoundedButton(symbol: "Plus", dest: TambahPrestasi())
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
  final String fotoanggota1;
  final String fotoanggota2;
  final String fotoanggota3;
  final String fotoanggota4;
  final String fotoanggota5;
  final String namaanggota1;
  final String namaanggota2;
  final String namaanggota3;
  final String namaanggota4;
  final String namaanggota5;

  DataPrestasi({
    required this.namalomba,
    this.fotoanggota1 = '',
    this.fotoanggota2 = '',
    this.fotoanggota3 = '',
    this.fotoanggota4 = '',
    this.fotoanggota5 = '',
    this.namaanggota1 = 'Anggota 1',
    this.namaanggota2 = 'Anggota 2',
    this.namaanggota3 = 'Anggota 3',
    this.namaanggota4 = 'Anggota 4',
    this.namaanggota5 = 'Anggota 5',
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
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  image: NetworkImage(fotoanggota1))),
                        ),
                        Text(namaanggota1)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  image: NetworkImage(fotoanggota2))),
                        ),
                        Text(namaanggota2)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  image: NetworkImage(fotoanggota3))),
                        ),
                        Text(namaanggota3)
                      ],
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: NetworkImage(fotoanggota4))),
                          ),
                          Text(namaanggota4)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                    image: NetworkImage(fotoanggota5))),
                          ),
                          Text(namaanggota5)
                        ],
                      )
                    ]),
              ])),
    );
  }
}
