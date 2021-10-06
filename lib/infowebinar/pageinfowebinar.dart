import 'package:dtk_database_tekkom/infolomba/formlomba.dart';
import 'package:dtk_database_tekkom/template/buttontemplate.dart';
import 'package:dtk_database_tekkom/template/headerfooter.dart';
import 'package:dtk_database_tekkom/mainpage/mainmenu.dart';
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
                "INFO LOMBA",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            YellowInfo(
                poster: "",
                namalomba: "MAGE 7",
                penyelenggaralomba: "TEKNIK KOMPUTER ITS",
                skalalomba: "NASIONAL",
                tanggal: "5 OKTOBER 2021",
                harga: 100000),
            YellowInfo(
                poster: "",
                namalomba: "MAGE 7",
                penyelenggaralomba: "TEKNIK KOMPUTER ITS",
                skalalomba: "NASIONAL",
                tanggal: "5 OKTOBER 2021",
                harga: 150000),
            YellowInfo(
                poster: "",
                namalomba: "MAGE 7",
                penyelenggaralomba: "TEKNIK KOMPUTER ITS",
                skalalomba: "NASIONAL",
                tanggal: "5 OKTOBER 2021",
                harga: 155000)
          ],
        )),
        InfoBottom(
          hinttext: "Back",
          iconArrow: "Left",
          plus: FormInfo(),
          back: MainMenu(),
          store: MainMenu(),
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
