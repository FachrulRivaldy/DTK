import 'package:dtk_database_tekkom/infoworkshop/databankworkshop.dart';
import 'package:dtk_database_tekkom/infoworkshop/formworkshop.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InfoWorkshop extends StatelessWidget {
  const InfoWorkshop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
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
                "INFO WORKSHOP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return YellowInfo(
                      poster: "",
                      namalomba: "MAGE 7",
                      penyelenggaralomba: "TEKNIK KOMPUTER ITS",
                      skalalomba: "NASIONAL",
                      tanggal: "5 OKTOBER 2021",
                      harga: 100000);
                })),
        InfoBottomAdmin(
          hinttext: "Back",
          iconArrow: "Left",
          plus: FormWorkshop(),
          back: MainMenu(),
          store: DatabankWorkshop(),
        )
      ])),
    );
  }
}

class CardLomba extends StatelessWidget {
  final String poster;
  final String namalomba;
  final String penyelenggaralomba;
  final String tanggal;
  final String skalalomba;
  final int harga;
  final harganya = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final double width;
  final double height;

  CardLomba(
      {required this.poster,
      required this.namalomba,
      required this.penyelenggaralomba,
      required this.skalalomba,
      required this.tanggal,
      required this.harga,
      this.height = 550,
      this.width = 350});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      color: Colors.yellow,
                      height: height,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: Container(
          color: Colors.yellow,
          height: height - 420,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height - 450,
                  width: width - 285,
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama : " + namalomba,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Penyelenggara : " + penyelenggaralomba,
                          overflow: TextOverflow.ellipsis),
                      Text("Skala : " + skalalomba,
                          overflow: TextOverflow.ellipsis),
                      Text("Tanggal : " + tanggal,
                          overflow: TextOverflow.ellipsis),
                      Text("Harga : " + harganya.format(harga),
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
