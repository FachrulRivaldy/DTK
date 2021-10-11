import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infolomba/databanklomba.dart';
import 'package:dtk_database_tekkom/infolomba/formlomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
import 'package:flutter/material.dart';

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
                .collection('databaselomba')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var namalomba = snapshot.data!.docs[index]['Nama'];
                        var penyelenggaralomba =
                            snapshot.data!.docs[index]['Penyelenggara'];
                        var skalalomba = snapshot.data!.docs[index]['Skala'];
                        var tanggal = snapshot.data!.docs[index]['Tanggal'];
                        var harga = snapshot.data!.docs[index]['Harga'];
                        return YellowInfo(
                            poster: "",
                            namalomba: namalomba,
                            penyelenggaralomba: penyelenggaralomba,
                            skalalomba: skalalomba,
                            tanggal: tanggal,
                            harga: harga);
                      }));
            },
          ),
        ),

        /*Expanded(
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
                })),*/
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

class InfoLombaBot extends StatelessWidget {
  const InfoLombaBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
