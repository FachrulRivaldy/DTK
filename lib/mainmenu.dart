import 'package:dtk_database_tekkom/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:dtk_database_tekkom/buttontemplate.dart';

class TopMainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: 185,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45))),
          child: Row(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(160),
              child: Image.asset('assets/images/logotekkom.png', scale: 4),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MUHAMAMD FACHRUL RIVALDY",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "07211940000032",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "SEMESTER 5",
                  style: TextStyle(fontSize: 14),
                )
              ],
            )
          ])),
      Expanded(child: MainMenu())
    ]);
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  (YellowButton(
                    dest: LoginPage(),
                    hinttext: "SILABUS\n& Bank Soal",
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  YellowButton(hinttext: "INFO LOMBA", dest: LoginPage())
                ],
              ),
              Row(
                children: [
                  (YellowButton(
                    dest: LoginPage(),
                    hinttext: "SILABUS\n& Bank Soal",
                  )),
                  SizedBox(
                    width: 50,
                  ),
                  YellowButton(hinttext: "INFO LOMBA", dest: LoginPage())
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
