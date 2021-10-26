import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtk_database_tekkom/infowebinar/pageinfowebinar.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class DatabankWebinar extends StatelessWidget {
  final TextEditingController publishWebinar = TextEditingController();

  validator() {
    FirebaseFirestore.instance
        .collection("databasewebinar")
        .doc(publishWebinar.text)
        .update({'Publish': true});
  }

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
              "DATABANK WEBINAR",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("databasewebinar")
              .where('Publish', isEqualTo: false)
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
                        return CardWebinar(
                            width: 320,
                            posterwebinar: "",
                            namawebinar: documentSnapshot["Nama"],
                            penyelenggarawebinar:
                                documentSnapshot["Penyelenggara"],
                            skalawebinar: documentSnapshot["Skala"],
                            tanggalwebinar: documentSnapshot["Tanggal"],
                            hargawebinar: documentSnapshot["Harga"]);
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
                  dest: InfoWebinar(),
                  hinttext: "Back",
                  iconArrow: "Left",
                ),
                Container(
                  alignment: Alignment.center,
                  width: 103,
                  height: 45,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Publish"),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                    onPressed: () {
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InfoLomba()))*/

                      showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  color: Colors.yellow,
                                  height: 250,
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Container(
                                      color: Colors.lightBlue,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Masukkan Nama Webinar",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: 50,
                                              child: TextFormField(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                controller: publishWebinar,
                                                maxLines: 1,
                                                decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50))),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 50,
                                                  height: 50,
                                                  child: ElevatedButton(
                                                    child: Icon(Icons.add),
                                                    onPressed: () {},
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18)))),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: 50,
                                                  width: 105,
                                                  child: ElevatedButton(
                                                    child: Row(
                                                      children: [
                                                        Text("Publish"),
                                                        Icon(Icons.arrow_right),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      validator();
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  InfoWebinar()));
                                                    },
                                                    style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            18)))),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                )
              ])),
    ])));
  }
}
