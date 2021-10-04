import 'package:dtk_database_tekkom/buttontemplate.dart';
import 'package:dtk_database_tekkom/headerfooter.dart';
import 'package:flutter/material.dart';

class InfoLomba extends StatelessWidget {
  const InfoLomba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Header(),
        Expanded(
            child: ListView(
          children: [
            YellowInfo(
                poster: "poster",
                namalomba: "namalomba",
                penyelenggaralomba: "penyelenggaralomba",
                skalalomba: "skalalomba",
                tanggal: "tanggal"),
            YellowInfo(
                poster: "poster",
                namalomba: "namalomba",
                penyelenggaralomba: "penyelenggaralomba",
                skalalomba: "skalalomba",
                tanggal: "tanggal"),
            YellowInfo(
                poster: "poster",
                namalomba: "namalomba",
                penyelenggaralomba: "penyelenggaralomba",
                skalalomba: "skalalomba",
                tanggal: "tanggal")
          ],
        ))
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
