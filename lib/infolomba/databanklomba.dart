import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class DatabankLomba extends StatelessWidget {
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
              "DATABANK LOMBA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("databanklomba")
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

                        return Row(
                          children: [
                            CardLomba(
                                width: 320,
                                poster: "",
                                namalomba: documentSnapshot["Nama"],
                                penyelenggaralomba:
                                    documentSnapshot["Penyelenggara"],
                                skalalomba: documentSnapshot["Skala"],
                                tanggal: documentSnapshot["Tanggal"],
                                harga: documentSnapshot["Harga"]),
                            Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(color: Colors.green),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => InfoLomba()),
                                    );
                                  },
                                  child: Icon(
                                    Icons.checklist,
                                    color: Colors.black,
                                  ),
                                ))
                          ],
                        );
                      }));
            }
          },
        ),
      ),
      Container(
          margin: EdgeInsets.only(bottom: 5),
          height: 100,
          width: 350,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LongButton(
                  dest: InfoLomba(),
                  hinttext: "Back",
                  iconArrow: "Left",
                ),
              ])),
    ])));
  }
}
