import 'package:dtk_database_tekkom/infowebinar/databankwebinar.dart';
import 'package:dtk_database_tekkom/infowebinar/formwebinar.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InfoWebinar extends StatelessWidget {
  const InfoWebinar({Key? key}) : super(key: key);

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
                "INFO WEBINAR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CardWebinar(
                      posterwebinar: "",
                      namawebinar: "MAGE 7",
                      penyelenggarawebinar: "TEKNIK KOMPUTER ITS",
                      skalawebinar: "NASIONAL",
                      tanggalwebinar: "5 OKTOBER 2021",
                      hargawebinar: 100000);
                })),
        InfoBottomAdmin(
          hinttext: "Back",
          iconArrow: "Left",
          plus: FormWebinar(),
          back: MainMenu(),
          store: DatabankWebinar(),
        )
      ])),
    );
  }
}

class CardWebinar extends StatelessWidget {
  final String posterwebinar;
  final String namawebinar;
  final String penyelenggarawebinar;
  final String tanggalwebinar;
  final String skalawebinar;
  final int hargawebinar;
  final harganya = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final double width;
  final double height;

  CardWebinar(
      {required this.posterwebinar,
      required this.namawebinar,
      required this.penyelenggarawebinar,
      required this.skalawebinar,
      required this.tanggalwebinar,
      required this.hargawebinar,
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
                        "Nama : " + namawebinar,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Penyelenggara : " + penyelenggarawebinar,
                          overflow: TextOverflow.ellipsis),
                      Text("Skala : " + skalawebinar,
                          overflow: TextOverflow.ellipsis),
                      Text("Tanggal : " + tanggalwebinar,
                          overflow: TextOverflow.ellipsis),
                      Text("Harga : " + harganya.format(hargawebinar),
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
