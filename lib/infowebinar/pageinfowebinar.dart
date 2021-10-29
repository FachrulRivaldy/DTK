import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infowebinar/databankwebinar.dart';
import 'package:dtk_database_tekkom/infowebinar/formwebinar.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class InfoWebinar extends StatefulWidget {
  const InfoWebinar({Key? key}) : super(key: key);

  @override
  _InfoWebinarState createState() => _InfoWebinarState();
}

class _InfoWebinarState extends State<InfoWebinar> {
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
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("databasewebinar")
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
                                    .collection("databasewebinar")
                                    .doc(documentSnapshot["Nama"])
                                    .delete();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Item Deleted")));
                            },
                            background: Container(
                              color: Colors.red,
                            ),
                            child: CardWebinar(
                                posterwebinar: "",
                                namawebinar: documentSnapshot["Nama"],
                                penyelenggarawebinar:
                                    documentSnapshot["Penyelenggara"],
                                skalawebinar: documentSnapshot["Skala"],
                                tanggalwebinar: documentSnapshot["Tanggal"],
                                hargawebinar: documentSnapshot["Harga"]),
                          );
                        }));
              }
            },
          ),
        ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
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
