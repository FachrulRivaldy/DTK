import 'package:dtk_database_tekkom/infowebinar/pageinfowebinar.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:flutter/material.dart';

class DatabankWebinar extends StatelessWidget {
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
              ])),
    ])));
  }
}
