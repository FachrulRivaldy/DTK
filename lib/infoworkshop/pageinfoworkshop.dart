import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infoworkshop/databankworkshop.dart';
import 'package:dtk_database_tekkom/infoworkshop/formworkshop.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InfoWorkshop extends StatefulWidget {
  const InfoWorkshop({Key? key}) : super(key: key);

  @override
  _InfoWorkshopState createState() => _InfoWorkshopState();
}

class _InfoWorkshopState extends State<InfoWorkshop> {
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
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("databaseworkshop")
                .where('Publish', isEqualTo: true)
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

                          return Dismissible(
                            key: Key(documentSnapshot["Nama"]),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                FirebaseFirestore.instance
                                    .collection("databaseworkshop")
                                    .doc(documentSnapshot["Nama"])
                                    .delete();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Item Deleted")));
                            },
                            background: Container(
                              color: Colors.red,
                            ),
                            child: CardWorkshop(
                                posterworkshop: "",
                                namaworkshop: documentSnapshot["Nama"],
                                penyelenggaraworkshop:
                                    documentSnapshot["Penyelenggara"],
                                skalaworkshop: documentSnapshot["Skala"],
                                tanggalworkshop: documentSnapshot["Tanggal"],
                                hargaworkshop: documentSnapshot["Harga"]),
                          );
                        }));
              }
            },
          ),
        ),
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

class CardWorkshop extends StatelessWidget {
  final String posterworkshop;
  final String namaworkshop;
  final String penyelenggaraworkshop;
  final String tanggalworkshop;
  final String skalaworkshop;
  final int hargaworkshop;
  final harganya = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final double width;
  final double height;

  CardWorkshop(
      {required this.posterworkshop,
      required this.namaworkshop,
      required this.penyelenggaraworkshop,
      required this.skalaworkshop,
      required this.tanggalworkshop,
      required this.hargaworkshop,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama : " + namaworkshop,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Penyelenggara : " + penyelenggaraworkshop,
                          overflow: TextOverflow.ellipsis),
                      Text("Skala : " + skalaworkshop,
                          overflow: TextOverflow.ellipsis),
                      Text("Tanggal : " + tanggalworkshop,
                          overflow: TextOverflow.ellipsis),
                      Text("Harga : " + harganya.format(hargaworkshop),
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
