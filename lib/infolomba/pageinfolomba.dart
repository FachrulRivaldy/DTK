import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infolomba/databanklomba.dart';
import 'package:dtk_database_tekkom/infolomba/formlomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoLomba extends StatelessWidget {
  const InfoLomba({Key? key}) : super(key: key);

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
                "INFO LOMBA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("databaselomba")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Scaffold();
              } else {
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data!.docs[index];

                          return CardLomba(
                              poster: "",
                              namalomba: documentSnapshot["Nama"],
                              penyelenggaralomba:
                                  documentSnapshot["Penyelenggara"],
                              skalalomba: documentSnapshot["Skala"],
                              tanggal: documentSnapshot["Tanggal"],
                              harga: documentSnapshot["Harga"]);
                        }));
              }
            },
          ),
        ),
        InfoBottomAdmin(
          hinttext: "Back",
          iconArrow: "Left",
          plus: FormLomba(),
          back: MainMenu(),
          store: DatabankLomba(),
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
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height - 450,
                  width: width - 285,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
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
