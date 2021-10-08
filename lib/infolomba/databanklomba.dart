import 'package:dtk_database_tekkom/infolomba/pageinfolomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
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
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    YellowInfo(
                      poster: "",
                      namalomba: "MAGE 7",
                      penyelenggaralomba: "TEKNIK KOMPUTER ITS",
                      skalalomba: "NASIONAL",
                      tanggal: "5 OKTOBER 2021",
                      harga: 100000,
                      width: 325,
                    ),
                    Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(color: Colors.green),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoLomba()));
                          },
                          child: Icon(
                            Icons.checklist,
                            color: Colors.black,
                          ),
                        ))
                  ],
                );
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
                  dest: InfoLomba(),
                  hinttext: "Back",
                  iconArrow: "Left",
                ),
              ])),
    ])));
  }
}
